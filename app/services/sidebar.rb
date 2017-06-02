module Sidebar
  class Link
    attr_reader :title

    def initialize(obj, kind)
      @title, @slug = obj.values_at(:title, :slug)
      @kind = kind
    end

    def path
      "/#{@kind.to_s.pluralize}/#{@slug}"
    end

    def emphasis?
      @kind == :exhibition
    end
  end

  class Links
    attr_reader :artworks, :exhibitions

    def initialize(artworks, exhibitions)
      @artworks = artworks.map { |artwork| Link.new(artwork, :artwork) }
      @exhibitions = exhibitions.map { |exhibition| Link.new(exhibition, :exhibition) }
    end
  end
end
