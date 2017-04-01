class ArtworksController < ApplicationController
  ArtworksIndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
    {
      artworks {
        slug
        title
        images {
          thumb: resized(width: 100, height: 100) {
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
    @artworks = query(ArtworksIndexQuery, {}, :artworks)
  end

  SidebarQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
    {
      sidebar: artworks(state: [SELECTED, PUBLISHED]) {
        title
        slug
      }
    }
  GRAPHQL

  ArtworksShowQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
    query($id: ID!) {
      artwork(id: $id) {
        intent
        src
        title
        description(format: HTML)
        year
        dimensions {
          centimeters {
            to_s
          }
          inches {
            to_s
          }
        }
        material
        duration
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
        links {
          title
          url
          kind
        }
        embeds {
          html
        }
        attachments {
          title
          url
        }
      }
    }
  GRAPHQL

  def show
    @sidebar = query(SidebarQuery, {}, :sidebar)
    @artwork = query(ArtworksShowQuery, { id: params.require(:id) }, :artwork)
  end
end
