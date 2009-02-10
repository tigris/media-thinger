class Movie < ActiveRecord::Base
  include Imdbable
  define_index do
    indexes title, :sortable => true
    indexes plot
    indexes tagline
    indexes media.watched
    indexes year, :sortable => true
    indexes imdb
    indexes imdb_rating, :sortable => true
    indexes media.user_id
  end

  def self.create_from_imdb(imdb)
    create({
      :imdb        => imdb.id,
      :title       => imdb.title,
      :genres      => imdb.genres.join('|'),
      :plot        => imdb.plot,
      :year        => imdb.year,
      :imdb_rating => imdb.rating,
      :keywords    => imdb.keywords.join('|'),
      :tagline     => imdb.tagline,
      :runtime     => imdb.runtime,
      :year        => imdb.year
    })
  end
end
