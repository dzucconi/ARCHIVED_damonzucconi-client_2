class RemoteCSV
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def csv
    @csv ||= begin
      handler = open(url)
      encoded = handler.read.force_encoding('ASCII-8BIT').force_encoding('UTF-8')
      CSV.parse(encoded)
    end
  end

  def fields
    @fields ||= csv.first.map(&:parameterize).map(&:to_sym)
  end

  def struct
    Struct.new(*fields)
  end

  def rows
    @rows ||= csv[1..-1].map do |row|
      struct.new(*row)
    end
  end
end
