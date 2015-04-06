class SubmissionsController < ApplicationController

  def new
    unless can? :create, Submission
      return redirect_to root_path, alert: "You aren't allowed to submit artwork."
    end

    @code = Code.find(params[:id])
    @submission = @code.submissions.new
  end

  def create
    unless can? :create, Submission
      return redirect_to root_path, alert: "You aren't allowed to submit artwork."
    end

    @code = Code.find(params[:id])
    @submission = @code.submissions.create(submission_params)

    if @submission.persisted?
      redirect_to codes_path, notice: "Submission added successfully!"
    else
      render :new
    end

  end

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

    # if request.xhr?
    #   render nothing: true, status: 200
    # else
    #   render nothing: true, status: 200
    # end

    redirect_to root_path, notice: "Your vote was successful!"
  end

  private

    def submission_params
      params.require(:submission).permit!
    end
end
