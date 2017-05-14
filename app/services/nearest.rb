module Nearest
  class Scored
    attr_reader :path, :distance

    def initialize(path, distance)
      @path = path
      @distance = distance
    end
  end

  class Finder
    attr_reader :current_path, :paths

    def initialize(current_path, paths)
      @current_path = current_path
      @paths = paths
    end

    def scored
      @scored ||= paths.map do |path|
        Scored.new(path, self.class.distance(current_path, path))
      end
    end

    def top
      scored.min_by(&:distance)
    end

    def ranked
      scored.sort_by(&:distance)
    end

    class << self
      def distance(a, b)
        [(0..a.size).to_a].tap do |mx|
          (1..b.size).each do |j|
            mx << [j] + [0] * a.size
          end
          (1..b.size).each do |i|
            (1..a.size).each do |j|
              mx[i][j] = if a[j - 1] == b[i - 1]
                           mx[i - 1][j - 1]
                         else
                           [mx[i - 1][j], mx[i][j - 1], mx[i - 1][j - 1]].min + 1
              end
            end
          end
        end[-1][-1]
      end
    end
  end
end
