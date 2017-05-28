ArtworksDescriptionsQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  {
    artworks(state: [SELECTED, PUBLISHED]) {
      slug
      description
    }
  }
GRAPHQL
