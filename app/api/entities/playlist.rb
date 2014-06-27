module API
  module Entities
    class Playlist < Grape::Entity
      format_with(:iso_timestamp) { |dt| dt.iso8601 }

      expose :id
      expose :name

      with_options(format_with: :iso_timestamp) do
        expose :published_at
      end
    end
  end
end
