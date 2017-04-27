IndexIndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  {
    exhibitions {
      slug
      title
    }

    artworks {
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
