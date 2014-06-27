module API
  class Playlists < Grape::API
    version 'v1', using: :header, vendor: :playlists
    format :json

    resource :playlists do
      desc "Return published playlists"
      get :published do
        playlists = PlaylistRepository.published.to_a
        present playlists, with: Entities::Playlist
      end

      desc "Return a playlist."
      params do
        requires :id, type: Integer, desc: "Playlist id."
      end
      route_param :id do
        get do
          PlaylistRepository.find(params[:id])
        end
      end

      desc "Create a playlist."
      params do
        requires :name, type: String, desc: "Playlist name"
      end
      post do
        PlaylistRepository.create(
          Playlist.new(name: params[:name])
        )
      end

      desc "Delete a playlist."
      params do
        requires :id, type: Integer, desc: "Playlist ID."
      end
      delete ':id' do
        playlist = PlaylistRepository.find(params[:id])
        PlaylistRepository.delete(playlist).destroy
      end
    end
  end
end
