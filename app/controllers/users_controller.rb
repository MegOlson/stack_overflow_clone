class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've succesfully signed up!"
      session[:user_id] = @user.id
      redirect_to session_path(@user)
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to new_user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attribute(:is_admin, true)
      flash[:notice] = "User Admin Status Updated"
      redirect_to '/questions'
    else
      redirect_to '/'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User account has been deleted."
    redirect_to '/questions'
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
