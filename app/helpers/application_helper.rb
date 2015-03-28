module ApplicationHelper

  def title(page_title)
    content_for(:title) { "Gurl Code | #{page_title}" }
  end
end
