module Sidebar
  class Link
    attr_reader :title, :updated_at

    def initialize(obj, kind)
      @title, @slug, @year, @updated_at = obj.values_at(:title, :slug, :year, :updated_at)
      @kind = kind
    end

    def path
      "/#{@kind.to_s.pluralize}/#{@slug}"
    end

    def score
      -([@year, @updated_at].join('').to_i)
    end
  end

  class Links
    attr_reader :artworks, :exhibitions

    def initialize(artworks, exhibitions)
      @artworks = artworks.map { |artwork| Link.new(artwork, :artwork) }
      @exhibitions = exhibitions.map { |exhibition| Link.new(exhibition, :exhibition) }
    end

    def links
      @links ||= artworks.concat(exhibitions).sort_by(&:score)
    end
  end
end
