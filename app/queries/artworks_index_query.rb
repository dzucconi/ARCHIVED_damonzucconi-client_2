ArtworksIndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  query($state: [State], $width: Int, $height: Int, $scale: Boolean) {
    artworks(state: $state) {
      slug
      title
      state
      images(state: PUBLISHED, limit: 1) {
        thumb: resized(width: $width, height: $height, scale: $scale) {
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
