class ArtworksController < ApplicationController
  def index
    params.reverse_merge!(state: %w[SELECTED PUBLISHED])

    @artworks = query(ArtworksIndexQuery, { state: params.require(:state).map(&:upcase) }, :artworks)
  end

  def show
    @artwork = query(ArtworksShowQuery, { id: params.require(:id) }, :artwork)
  end
end
