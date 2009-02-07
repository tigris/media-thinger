class Movie < ActiveRecord::Base
  has_many :media, :class_name => 'Media', :as => :watchable
end
