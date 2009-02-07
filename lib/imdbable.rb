require 'addressable/uri'
require 'imdb'

module Imdbable
  def self.included(recipient)
    recipient.extend(ModelClassMethods)
    recipient.class_eval do
      include ModelInstanceMethods
      validates_presence_of :imdb
    end
  end

  module ModelClassMethods
    def create_from_imdb(url)
      id  = url.to_s.match(/(tt\d+)/)[1] rescue nil
      if id and imdb = Imdb.find_movie_by_id(id)
        create(
          :imdb  => imdb.imdb_id,
          :title => imdb.title
        )
      else
        create
      end
    end
  end

  module ModelInstanceMethods
  end
end
