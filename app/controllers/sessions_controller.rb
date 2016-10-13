class SessionsController < ApplicationController

  def new


  end

  def create
    @current_user = User.find_by_email(params[:email])
    if @current_user && @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
