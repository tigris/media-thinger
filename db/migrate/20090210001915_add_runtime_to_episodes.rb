class AddRuntimeToEpisodes < ActiveRecord::Migration
  def self.up
    add_column :episodes, :runtime, :string, :null => true, :default => nil
  end

  def self.down
    remove_column :episodes, :runtime
  end
end
