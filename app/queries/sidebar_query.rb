SidebarQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  {
    artworks(state: [SELECTED, PUBLISHED]) {
      title
      slug
    }
    exhibitions(state: [SELECTED, PUBLISHED]) {
      title
      slug
    }
  }
GRAPHQL
