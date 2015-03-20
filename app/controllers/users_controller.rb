class UsersController < ApplicationController

  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, notice: "Logged in successfully!"
    else
      redirect_to new_user_session_url, alert: "Could not log in with Twitter"
    end
  end
end
