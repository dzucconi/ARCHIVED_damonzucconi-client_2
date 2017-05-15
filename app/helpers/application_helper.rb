module ApplicationHelper
  def nav_link(title, path, options = {})
    link_to_unless_current title, path, options do
      content_tag :span, title, options
    end
  end

  def touch?
    ua = request.headers['HTTP_USER_AGENT']
    ua.present? && ua =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
  end
end
