class ArtworksController < ApplicationController
  def index
    @artworks = query(ArtworksIndexQuery, {}, :artworks)
  end

  def show
    @sidebar = query(SidebarQuery, {}, :sidebar)
    @artwork = query(ArtworksShowQuery, { id: params.require(:id) }, :artwork)
  end
end
