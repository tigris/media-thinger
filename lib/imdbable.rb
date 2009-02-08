require 'addressable/uri'
require 'imdb'

module Imdbable
  def self.included(recipient)
    recipient.extend(ModelClassMethods)
    recipient.class_eval do
      include ModelInstanceMethods
      has_many :media, :class_name => 'Media', :as => :watchable
      validates_presence_of :imdb
      validates_uniqueness_of :imdb
    end
  end

  module ModelClassMethods
    def create_from_imdb(id)
      if imdb = Imdb.find_movie_by_id(id)
        create(
          :imdb        => imdb.imdb_id,
          :title       => imdb.title,
          :genres      => imdb.genres.map{|g| g.name}.join('|'),
          :plot        => imdb.plot,
          :tagline     => imdb.tagline,
          :runtime     => imdb.runtime,
          :year        => imdb.year,
          :imdb_rating => imdb.rating.to_i * 10,
          :keywords    => imdb.plot_keywords.map{|k| k.name}.join('|')
        )
      else
        raise ArgumentError.new('Invalid imdb id.')
      end
    end
  end

  module ModelInstanceMethods
  end
end
