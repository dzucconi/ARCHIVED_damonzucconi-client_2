class Sidebar
  attr_reader :artworks, :exhibitions

  def initialize(artworks, exhibitions)
    @artworks = artworks
    @exhibitions = exhibitions
  end
end
