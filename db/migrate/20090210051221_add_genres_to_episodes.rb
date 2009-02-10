class AddGenresToEpisodes < ActiveRecord::Migration
  def self.up
    add_column :episodes, :genres, :string
  end

  def self.down
    add_column :episodes, :genres
  end
end
