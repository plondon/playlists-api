# Playlists - API

Playlists API is the backend for the Playlists web app. The API exposes lists
for you to listen to and records your progress as you listen to each album.

Currently only Rdio is supported for metadata and playback.

## Resources Exposed

Album

* id
* title # inputted by me
* artist_name # inputted by me
* rdio_key

Playlist

* id
* name # inputted by me

PlaylistAlbum

* id
* playlist_id
* album_id
* position

User

* id

PlaylistFollow

* id
* user_id
* playlist_id

TrackListen

* id
* rdio_key
* album_id
* user_id

AlbumListen

* id
* album_id
* user_id
* complete
