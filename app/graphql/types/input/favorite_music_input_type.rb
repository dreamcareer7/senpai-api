module Types
  module Input
    class FavoriteMusicInputType < Types::BaseInputObject
      argument :user_id, ID, required: true
      argument :music_type, String, required: true
      argument :spotify_id, String, required: true
      argument :cover_url, String, required: true
      argument :track_name, String, required: false
      argument :artist_name, String, required: false
      argument :hidden, Boolean, required: false
    end
  end
end