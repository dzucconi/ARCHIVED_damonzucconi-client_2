class ArtworksController < ApplicationController
  IndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
    {
      representations {
        id
        title
        url
        mode
        images {
          scale
          thumb: resized(width: 800, height: 800, scale: true) {
            width
            height
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
    @representations = query(IndexQuery, {}, :representations)
  end

  SidebarQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
    {
      sidebar: artworks(state: [SELECTED, PUBLISHED]) {
        title
        slug
      }
    }
  GRAPHQL

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
    @sidebar = query(SidebarQuery, {}, :sidebar)
    @artwork = query(ShowQuery, { id: params.require(:id) }, :artwork)
  end
end
