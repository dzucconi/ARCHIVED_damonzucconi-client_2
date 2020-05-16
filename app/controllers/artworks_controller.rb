# frozen_string_literal: true

class ArtworksController < ApplicationController
  def index
    params.reverse_merge!(state: %w[SELECTED PUBLISHED])
    options = {
      state: params.require(:state).map(&:upcase),
      width: 200,
      height: 200,
      scale: 1.0
    }

    @title = 'Archive'
    @artworks = query(ArtworksIndexQuery, options, :artworks)
  end

  def selected
    options = {
      state: %w[SELECTED],
      width: 275,
      height: 275,
      scale: 1.0
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

  def websites
    options = { state: %w[SELECTED PUBLISHED] }
    artworks = query(ArtworksWebsitesQuery, options, :artworks)

    @urls = artworks
            .map(&:links)
            .flatten.select { |link| link.kind == 'canonical' }
            .map(&:url)
  end
end
