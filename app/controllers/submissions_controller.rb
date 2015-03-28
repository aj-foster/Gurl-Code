class SubmissionsController < ApplicationController

  def vote
    @submission = Submission.find(params[:id])
    @code = @submission.code

    if @code.status != "Featured"
      return redirect_to root_path, alert: "Voting isn't available for that submission"
    end

    if current_user.recent_vote == @code.id
      return redirect_to root_path, alert: "It looks like you've already voted"
    end

    if request.xhr?
      render nothing: true, status: 200
    else
      puts "Success, non-xhr request"
    end
  end
end
