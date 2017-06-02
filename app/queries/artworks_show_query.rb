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
      image: images(state: PUBLISHED, limit: 1) {
        resized(width: 1200, height: 630) {
          urls {
            _1x
          }
        }
      }
      images(state: PUBLISHED) {
        width
        height
        url
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
        kind
        url
      }
    }
  }
GRAPHQL
