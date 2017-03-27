class ArtworksController < ApplicationController
  IndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
    {
      representations {
        id
        title
        description
        url
        mode
        images {
          id
          scale
          thumb: resized(width: 480, height: 480, scale: true) {
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
          width
          height
          mobile: resized(width: 375, scale: false) {
            height
            width
            urls {
              _1x
              _2x
            }
          }
          small: resized(width: 375, height: 375, scale: true) {
            height
            width
            urls {
              _1x
              _2x
            }
          }
          medium: resized(width: 750, height: 750, scale: true) {
            height
            width
            urls {
              _1x
              _2x
            }
          }
          large: resized(width: 1125, height: 1125, scale: true) {
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
