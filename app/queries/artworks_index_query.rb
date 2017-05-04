ArtworksIndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  query($state: [State]) {
    artworks(state: $state) {
      slug
      title
      images(state: PUBLISHED, limit: 1) {
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
