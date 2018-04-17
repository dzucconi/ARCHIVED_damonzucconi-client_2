# frozen_string_literal: true

ExhibitionsIndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  query($state: [State]) {
    exhibitions(state: $state) {
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
