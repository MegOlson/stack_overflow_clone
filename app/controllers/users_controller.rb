class UserConstroller < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've succesfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to new_user
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end