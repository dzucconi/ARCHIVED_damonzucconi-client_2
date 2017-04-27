class DescriptionsController < ApplicationController
  def index
    @artworks = query(DescriptionsIndexQuery, {}, :artworks)
  end
end
