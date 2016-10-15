class SessionsController < ApplicationController

  def new


  end

  def create
    @current_user = User.find_by_email(params[:email])
    if @current_user && @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      flash[:notice] = "Welcome #{@current_user.first_name}!"
      redirect_to '/'
    else
      flash[:invalid] = "Invalid login"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
