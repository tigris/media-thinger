class AddImdbFieldsToEpisode < ActiveRecord::Migration
  def self.up
    add_column :episodes, :plot, :text
    add_column :episodes, :keywords, :string
    add_column :episodes, :imdb_rating, :integer
  end

  def self.down
    remove_column :episodes, :imdb_rating
    remove_column :episodes, :keywords
    remove_column :episodes, :plot
  end
end
