RepresentationsIndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
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
        mobile: resized(width: 375, scale: false) {
          height
          width
          urls {
            _1x
            _2x
          }
        }
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
