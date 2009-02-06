class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.belongs_to :series
      t.column :title, :string, :null => false
      t.column :season, :integer, :null => true, :default => nil
      t.column :number, :integer, :null => true, :default => nil
      t.column :first_aired, :timestamp, :null => true, :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end
