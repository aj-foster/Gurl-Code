class PagesController < ApplicationController

  def about
  end

  def home
    @code = Code.where(status: "Featured").first
    @submissions = @code.submissions.order(created_at: :asc).limit(2) unless @code.nil?
    @total = @submissions.collect { |s| s.votes }.inject(:+).to_f unless @submissions.nil?
    @total = 1.0 if @total == 0

    if @code.nil? || @submissions.size != 2
      render :gallery
    end
  end

  def coming_soon
  end

  def gallery
  end
end
