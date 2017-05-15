class DescriptionsController < ApplicationController
  caches_action :index, expires_in: 24.hours

  def index
    @artworks = query(DescriptionsIndexQuery, {}, :artworks)
  end
end
