module CV
  class Row
    def initialize(struct)
      @struct = struct
    end

    def displayable?
      @struct.display == 'TRUE'
    end

    def date
      args = [@struct.year, @struct.month, @struct.day].compact.map(&:to_i)
      Date.new(*args)
    end

    def timestamp
      date.to_time.to_i
    end

    private

    def method_missing(method, *args, &block)
      @struct.send(method, *args, &block)
    end
  end

  class Data
    attr_reader :csv

    def initialize(csv)
      @csv = csv
    end

    def selected
      csv.rows.map { |row| Row.new(row) }.select(&:displayable?)
    end

    def types
      selected.group_by(&:type)
    end

    def categories
      types
        .to_a
        .sort_by(&:first)
        .map do |type|
          [
            type.last.first.category,
            type.last.group_by(&:year)
              .to_a
              .sort_by { |year| -year.first.to_i }
              .map do |year|
                [
                  year.first,
                  year.last.sort_by { |row| -row.timestamp }
                ]
              end
          ]
        end
    end
  end

  def self.new(csv)
    Data.new(csv)
  end
end
