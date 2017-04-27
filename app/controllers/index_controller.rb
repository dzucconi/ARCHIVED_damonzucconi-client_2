class IndexController < ApplicationController
  def index
    @artworks, @exhibitions = query(IndexIndexQuery, {}, :artworks, :exhibitions)
  end
end
