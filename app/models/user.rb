class User < ActiveRecord::Base
  has_many :media, :class_name => 'Media'

  has_many :episodes,
    :through     => :media,
    :source      => :watchable,
    :source_type => 'Episode'

  has_many :movies,
    :through     => :media,
    :source      => :watchable,
    :source_type => 'Movie'
end
