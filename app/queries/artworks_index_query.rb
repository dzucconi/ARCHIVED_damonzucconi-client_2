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
