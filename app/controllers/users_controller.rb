class UsersController < ApplicationController
  def new
    @current_user = User.new
  end

  def create
    @current_user = User.new(user_params)

    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to '/'
    else
      redirect_to '/new'
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
