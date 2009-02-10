class AddImdbUrlToEpisodes < ActiveRecord::Migration
  def self.up
    add_column :episodes, :imdb, :integer, :null => true, :default => nil
  end

  def self.down
    remove_column :episodes, :imdb
  end
end
