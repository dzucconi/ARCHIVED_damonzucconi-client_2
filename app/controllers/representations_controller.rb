class RepresentationsController < ApplicationController
  caches_action :index, expires_in: 24.hours

  def index
    @representations = query(RepresentationsIndexQuery, {}, :representations)
  end
end
