class ArtworksController < ApplicationController
  IndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
    query {
      artworks(state: PUBLISHED) {
        title
        slug
        images {
          thumb: resized(width: 250, height: 250) {
            height
            width
            urls {
              _1x
              _2x
            }
          }
        }
      }
    }
  GRAPHQL

  def index
    @artworks = query(IndexQuery, {}, :artworks)
  end

  ShowQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
    query($id: ID!) {
      artwork(id: $id) {
        title
        year
        dimensions
        material
        images {
          id
          inline: resized(width: 900, height: 900) {
            height
            width
            urls {
              _1x
              _2x
            }
          }
        }
      }
    }
  GRAPHQL

  def show
    @artwork = query(ShowQuery, { id: params.require(:id) }, :artwork)
  end
end
