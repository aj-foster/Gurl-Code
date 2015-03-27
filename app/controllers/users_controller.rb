class UsersController < ApplicationController

  def twitter
    auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth)

    if @user.persisted?
      @user.update(handle: auth.info.nickname) if @user.handle != auth.info.nickname
      sign_in_and_redirect @user, notice: "Logged in successfully!"
    else
      redirect_to new_user_session_url, alert: "Could not log in with Twitter"
    end
  end
end
