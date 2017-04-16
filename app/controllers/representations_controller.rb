class RepresentationsController < ApplicationController
  def index
    @representations = query(RepresentationsIndexQuery, {}, :representations)
  end
end
