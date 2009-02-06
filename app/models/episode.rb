class Episode < ActiveRecord::Base
  belongs_to :series
  belongs_to :media, :polymorphic => true
end
