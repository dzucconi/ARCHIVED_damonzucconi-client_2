SidebarQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  {
    artworks(state: [SELECTED, PUBLISHED]) {
      title
      slug
      year
      updated_at(format: "%s")
    }
    exhibitions(state: [SELECTED, PUBLISHED]) {
      title
      slug
      year
      updated_at(format: "%s")
    }
  }
GRAPHQL
