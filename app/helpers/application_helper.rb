module ApplicationHelper
  def nav_link(title, path, options = {})
    link_to_unless_current title, path, options do
      content_tag :span, title, options
    end
  end
end
