class Episode < ActiveRecord::Base
  include Imdbable
  belongs_to :series
  define_index do
    indexes series.title, :as => :series
    indexes title
    indexes plot
    indexes media.watched
    has imdb_rating
    has media.user_id
  end
end
