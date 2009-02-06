class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.column :title, :string, :null => false
      t.column :imdb, :integer, :null => true, :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
