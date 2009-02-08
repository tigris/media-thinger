class AddImdbFieldsToMovie < ActiveRecord::Migration
  def self.up
    add_column :movies, :year, :integer
    add_column :movies, :genres, :string
    add_column :movies, :plot, :text
    add_column :movies, :tagline, :text
    add_column :movies, :keywords, :string
    add_column :movies, :imdb_rating, :integer
    add_column :movies, :runtime, :string
  end

  def self.down
    remove_column :movies, :runtime
    remove_column :movies, :imdb_rating
    remove_column :movies, :keywords
    remove_column :movies, :tagline
    remove_column :movies, :plot
    remove_column :movies, :genres
    remove_column :movies, :year
  end
end
