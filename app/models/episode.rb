class Episode < ActiveRecord::Base
  include Imdbable
  belongs_to :series
  define_index do
    indexes series.title, :as => :series
    indexes title, :sortable => true
    indexes plot
    indexes media.watched
    indexes imdb
    indexes imdb_rating, :sortable => true
    indexes first_aired, :sortable => true
    indexes media.user_id
  end

  def self.create_from_imdb(imdb)
    series = Series.find_by_imdb(imdb.series.id) || Series.create_from_imdb(imdb.series)
    create({
      :series      => series,
      :imdb        => imdb.id,
      :title       => imdb.title,
      :genres      => imdb.genres.join('|'),
      :plot        => imdb.plot,
      :imdb_rating => imdb.rating,
      :keywords    => imdb.keywords.join('|'),
      :runtime     => imdb.runtime,
      :first_aired => imdb.aired_date,
      :season      => imdb.season,
      :number      => imdb.episode
    })
  end
end
