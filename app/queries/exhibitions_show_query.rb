# frozen_string_literal: true

ExhibitionsShowQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  query($id: ID!) {
    exhibition(id: $id) {
      title
      description(format: HTML)
      start_date(format: "%B %e")
      end_date(format: "%B %e")
      start_year: start_date(format: "%Y")
      end_year: end_date(format: "%Y")
      city
      country
      venue
      external_url
      images(state: PUBLISHED) {
        width
        height
        url
        mobile: resized(width: 375, scale: 1.0) {
          height
          width
          urls {
            _1x
            _2x
          }
        }
        small: resized(width: 375, height: 375, scale: 1.0) {
          height
          width
          urls {
            _1x
            _2x
          }
        }
        medium: resized(width: 750, height: 750, scale: 1.0) {
          height
          width
          urls {
            _1x
            _2x
          }
        }
        large: resized(width: 1125, height: 1125, scale: 1.0) {
          height
          width
          urls {
            _1x
            _2x
          }
        }
      }
    }
  }
GRAPHQL
