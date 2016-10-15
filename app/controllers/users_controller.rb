class UsersController < ApplicationController
  def new
    @current_user = User.new
  end

  def create
    @current_user = User.new(user_params)

    if @current_user.save
      session[:user_id] = @current_user.id
      flash[:notice] = "Sign-up successful. Welcome to Jungle #{@current_user.first_name}!"
      redirect_to :root
    else
      flash[:notice] = "Sign-up unsuccessful. Please try again."
      redirect_to new_user_path, notice: "Something isn't right. Please try again"
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name,
                                :last_name,
                                :email,
                                :password,
                                :password_confirmation
                                )
  end
end
