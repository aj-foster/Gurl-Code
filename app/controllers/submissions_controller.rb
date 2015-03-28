class SubmissionsController < ApplicationController

  def vote
    @submission = Submission.find(params[:id])
    @code = @submission.code

    if @code.status != "Featured"
      return redirect_to root_path, status: 303, alert: "Voting isn't available for that submission"
    end

    if current_user.recent_vote == @code.id
      return redirect_to root_path, status: 303, alert: "It looks like you've already voted"
    end

    @submission.increment! :votes
    current_user.update(recent_vote: @code.id)

    if request.xhr?
      render nothing: true, status: 200
    else
      render nothing: true, status: 200
    end
  end
end
