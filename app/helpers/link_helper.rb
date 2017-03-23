module LinkHelper
  def is_absolute?(url)
    URI.parse(url).absolute?
  end

  def path_type(url)
    is_absolute?(url) ? 'absolute' : 'relative'
  end

  def target(url)
    is_absolute?(url) ? '_blank' : ''
  end
end
