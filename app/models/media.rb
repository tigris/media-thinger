class Media < ActiveRecord::Base
  # Rails doesn't seem to understand that the plural of media is media.
  def self.table_name
    'media'
  end

  belongs_to :user
  belongs_to :watchable, :polymorphic => true

  validates_uniqueness_of :watchable_id,
    :scope   => [ :watchable_type, :user_id ],
    :message => 'is already in your library.'

  def movie?
    watchable_type == 'Movie'
  end

  def episode?
    watchable_type == 'Episode'
  end
end
