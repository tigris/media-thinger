class Series < ActiveRecord::Base
  has_many :episodes
  validates_uniqueness_of :imdb

  def season(season)
    # TODO: this will actually fetch all then limit, should limit with SQL using find_by_?
    episodes.select{|e| e.season = season}
  end
end
