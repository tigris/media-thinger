require 'digest/sha1'

class Users < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  has_many :media, :class_name => 'Media'

  has_many :episodes,
    :through     => :media,
    :source      => :watchable,
    :source_type => 'Episode'

  has_many :movies,
    :through     => :media,
    :source      => :watchable,
    :source_type => 'Movie'

  validates_presence_of :name
  validates_format_of   :name,
    :with    => Authentication.name_regex,
    :message => Authentication.bad_name_message

  validates_presence_of   :email
  validates_uniqueness_of :email
  validates_length_of     :email, :within  => 6..100
  validates_format_of     :email,
    :with    => Authentication.email_regex,
    :message => Authentication.bad_email_message

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :email, :name, :password, :password_confirmation

  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_email(login)
    u && u.authenticated?(password) ? u : nil
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
end
