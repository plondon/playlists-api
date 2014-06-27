module API
  class API < Grape::API
    prefix 'api'
    format :json
    mount Playlists

    #add_swagger_documentation api_version: 'v1'
  end
end
