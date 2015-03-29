module ApplicationHelper

  def pluralize!(count, singular, plural = nil)
    word = if (count == 1 || count =~ /^1(\.0+)?$/)
      singular
    else
      plural || singular.pluralize
    end

    "#{word}"
  end

  def title(page_title)
    content_for(:title) { "Gurl Code | #{page_title}" }
  end
end
