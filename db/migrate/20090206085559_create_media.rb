class CreateMedia < ActiveRecord::Migration
  def self.up
    create_table :media do |t|
      t.belongs_to :user
      t.references :watchable, :polymorphic => true
      t.column :watched, :boolean, :null => false, :default => false
      t.column :quality, :integer, :null => true, :default => nil
      t.column :location, :string, :null => true, :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :media
  end
end
