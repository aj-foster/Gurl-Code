class PagesController < ApplicationController

  def about
  end

  def home
    @code = Code.where(status: "Featured").first
    @submissions = @code.submissions.limit(2) unless @code.nil?
  end

  def coming_soon
  end

  def gallery
  end
end
