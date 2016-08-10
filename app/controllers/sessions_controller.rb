class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.where("email = ?", params[:session][:email].downcase).first
  	if user && user.authenticate(params[:session][:password])
  	  #log_in user
  	  session[:user_id] = user.id
  	  redirect_to root_url
  	else
  	  flash[:danger] = "Invalid email/password combination"
  	  render 'new'
  	end
  end

  def destroy
  	#log_out
  	session.delete(:user_id)
  	@current_user = nil
  	redirect_to root_url
  end

end
