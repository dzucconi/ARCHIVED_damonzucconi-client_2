ArtworksIndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  {
    artworks {
      slug
      title
      images(state: PUBLISHED) {
        thumb: resized(width: 200, height: 200) {
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
