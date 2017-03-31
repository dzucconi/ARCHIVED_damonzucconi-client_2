module ApplicationHelper
  def nav_link(title, path)
    link_to_unless_current title, path do
      content_tag :span, title
    end
  end
end
