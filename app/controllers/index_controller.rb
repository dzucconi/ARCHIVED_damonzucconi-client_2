class IndexController < ApplicationController
  caches_action :index, expires_in: 24.hours

  def index
    @artworks, @exhibitions = query(IndexIndexQuery, {}, :artworks, :exhibitions)
  end
end
