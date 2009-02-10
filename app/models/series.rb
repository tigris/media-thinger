class Series < ActiveRecord::Base
  has_many :episodes
  validates_uniqueness_of :imdb

  def season(season)
    episodes.find(:all, :conditions => { :season => season })
  end

  def self.create_from_imdb(imdb)
    create({
      :imdb  => imdb.id,
      :title => imdb.title
    })
  end
end
