class ConvertImdbIdToString < ActiveRecord::Migration
  def self.up
    remove_column :movies, :imdb
    add_column :movies, :imdb, :string, :null => false
    add_column :episodes, :imdb, :string, :null => false
  end

  def self.down
    remove_column :movies, :imdb
    remove_column :episodes, :imdb
    add_column :movies, :imdb, :integer, :null => false
  end
end
