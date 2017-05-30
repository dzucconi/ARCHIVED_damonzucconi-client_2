class ArtworksController < ApplicationController
  def index
    params.reverse_merge!(state: %w[SELECTED PUBLISHED])
    options = {
      state: params.require(:state).map(&:upcase),
      width: 200,
      height: 200,
      scale: false
    }

    @artworks = query(ArtworksIndexQuery, options, :artworks)
  end

  def selected
    options = {
      state: %w[SELECTED],
      width: 275,
      height: 275,
      scale: true
    }

    @artworks = query(ArtworksIndexQuery, options, :artworks)

    render :index
  end

  def descriptions
    @artworks = query(ArtworksDescriptionsQuery, {}, :artworks)
  end

  def table
    @artworks = query(ArtworksTableQuery, {}, :artworks)
  end

  def show
    @artwork = query(ArtworksShowQuery, { id: params.require(:id) }, :artwork)
  end
end
