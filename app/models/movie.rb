class Movie < ActiveRecord::Base
  include Imdbable
  define_index do
    indexes title
    indexes plot
    indexes tagline
    indexes media.watched
    indexes year
    has imdb_rating
    has media.user_id
  end
end
