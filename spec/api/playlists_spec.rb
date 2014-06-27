require 'spec_helper'

describe API::Playlists do
  include Rack::Test::Methods

  def app
    API::Playlists
  end

  describe "GET /api/playlists/published" do
    it "returns an empty array of playlists when none are present" do
      get "/api/playlists/published"

      expect(last_response.status).to eq 200
      expect(JSON.parse(last_response.body)).to eq []
    end

    it "returns an empty array of playlists when none are published" do
      p1 = PlaylistRepository.create(Playlist.new(name: "Test List 1"))
      p2 = PlaylistRepository.create(Playlist.new(name: "Test List 2"))

      get "/api/playlists/published"

      expect(last_response.status).to eq 200
      expect(JSON.parse(last_response.body)).to eq []
    end

    it "returns an array of published playlists" do
      p1 = PlaylistRepository.create(Playlist.new(name: "Test List 1", published_at: Time.now - 5.minutes))
      p2 = PlaylistRepository.create(Playlist.new(name: "Test List 2"))
      p3 = PlaylistRepository.create(Playlist.new(name: "Test List 3", published_at: Time.now - 6.minutes))

      get "/api/playlists/published"
      resp = JSON.parse(last_response.body)

      expect(last_response.status).to eq 200
      expect(resp[0]['id']).to eq p3.id
      expect(resp[1]['id']).to eq p1.id
    end
  end

  describe "GET /api/playlists/:id" do
    it "returns a playlist by id" do
      playlist = PlaylistRepository.create(Playlist.new(name: "Test List"))

      get "/api/playlists/#{playlist.id}"

      expect(last_response.body).to eq playlist.to_json
    end
  end
end
