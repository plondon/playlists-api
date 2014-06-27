class Playlist
  include Lotus::Entity
  self.attributes = :name, :published_at
end

class PlaylistRepository
  include Lotus::Repository

  def self.published
    query do
      where(:published_at).
      order(:published_at)
    end
  end
end
