# frozen_string_literal: true

ArtworksTableQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  {
    artworks(state: [SELECTED, PUBLISHED]) {
      slug
      src
      title
      year
      material
      description(format: HTML)
      dimensions {
        inches {
          to_s
        }
        centimeters {
          to_s
        }
      }
    }
  }
GRAPHQL
