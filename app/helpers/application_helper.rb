module ApplicationHelper
  def nav_link_to(name, path)
    klass = 'active' if current_page?(path)

    content_tag(:li, link_to(name, path), class: klass)
  end
end
