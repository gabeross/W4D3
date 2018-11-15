class SessionsController < ApplicationController
  def new
    render :session 
  end
  
  def create 
    user = User.find_by_credentials(
      params[:user][:user_name]
      params[:user][:password]
    )
    
    if user.nil?
      flash.now[:errors] = ['Nice try, asshole!']
      render :new
    else
      login!(user)
      redirect_to cats_url
      #ensure_session_token?
    end
  end
  
end