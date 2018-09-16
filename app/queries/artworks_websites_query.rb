# frozen_string_literal: true

ArtworksWebsitesQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  query($state: [State]) {
    artworks(state: $state) {
      links {
        kind
        url
      }
    }
  }
GRAPHQL
