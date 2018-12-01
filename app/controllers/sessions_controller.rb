class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
    #  session[:user_id] = user.id
     flash[:success] = "Successfully Logged In!"
     redirect_to user
    else
     flash[:warning] = "Invalid email or password!"
     redirect_to login_path
    end
   end

   def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully Logged Out!"
    redirect_to login_path
   end

end

