class Movie < ActiveRecord::Base
  include Imdbable
  has_many :media, :class_name => 'Media', :as => :watchable
end
