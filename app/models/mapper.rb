mapper = Lotus::Model::Mapper.new do
  collection :playlists do
    entity Playlist

    attribute :id,   Integer
    attribute :name, String
    attribute :published_at, DateTime
  end

  #collection :articles do
  #  entity Article

  #  attribute :id,             Integer
  #  attribute :author_id,      Integer
  #  attribute :title,          String
  #  attribute :comments_count, Integer
  #  attribute :published,      Boolean
  #end
end

adapter = Lotus::Model::Adapters::SqlAdapter.new(mapper, DB_CONNECTION_URI)
PlaylistRepository.adapter  = adapter

mapper.load!
