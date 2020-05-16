# frozen_string_literal: true

class DocumentationController < ApplicationController
  def index
    params.reverse_merge!(state: %w[SELECTED PUBLISHED])
    options = {
      state: params.require(:state).map(&:upcase),
      width: 200,
      height: 200,
      scale: 1.0
    }

    @title = 'Documentation'
    @artworks = query(DocumentationIndexQuery, options, :artworks)
  end
end
