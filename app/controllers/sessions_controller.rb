class SessionsController < ApplicationController

  def new


  end

  def create

    if @current_user = User.authenticate_with_credentials(params[:email], params[:password])
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
    cart = nil
    redirect_to '/'
  end
end
