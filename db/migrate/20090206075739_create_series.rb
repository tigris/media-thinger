class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.column :title, :string, :null => false
      t.column :imdb, :integer, :null => true, :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :series
  end
end
