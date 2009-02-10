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
  end

  module ModelInstanceMethods
  end
end
