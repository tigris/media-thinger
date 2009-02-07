class Episode < ActiveRecord::Base
  belongs_to :series
  has_many :media, :class_name => 'Media', :as => :watchable
end
