DescriptionsIndexQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  {
    artworks {
      slug
      description
    }
  }
GRAPHQL
