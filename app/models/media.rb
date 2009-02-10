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

  def imdb
    watchable.imdb rescue nil
  end

  def imdb=(url)
    id = url.to_s.match(/\d+/)[0].to_i rescue nil
    if id.nil?
      errors.add('IMDB URL is not valid')
      return false
    end
    existing = (Movie.find_by_imdb(id) || Episode.find_by_imdb(id)) rescue nil
    if existing.nil?
      imdb = Imdb.find(id)
      existing = imdb.is_a?(Imdb::Movie) ? Movie.create_from_imdb(imdb) : Episode.create_from_imdb(imdb)
    end
    self.watchable_id = existing.id
    self.watchable_type = existing.class.to_s
  end
end
