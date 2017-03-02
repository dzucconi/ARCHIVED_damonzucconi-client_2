class Object
  def values_at(*attributes)
    if attributes.size == 1
      send(attributes.first)
    else
      attributes.map { |attribute| send(attribute) }
    end
  end
end
