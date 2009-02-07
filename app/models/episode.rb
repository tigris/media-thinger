class Episode < ActiveRecord::Base
  include Imdbable
  belongs_to :series
  has_many :media, :class_name => 'Media', :as => :watchable
end
