SidebarQuery = DamonZucconiAPI::Client.parse <<-'GRAPHQL'
  {
    sidebar: artworks(state: [SELECTED, PUBLISHED]) {
      title
      slug
    }
  }
GRAPHQL
