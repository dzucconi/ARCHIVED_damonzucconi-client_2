IndexIndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  {
    exhibitions(state: [SELECTED, PUBLISHED]) {
      slug
      title
    }

    artworks(state: [SELECTED, PUBLISHED]) {
      slug
      src
      title
      year
      material
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
