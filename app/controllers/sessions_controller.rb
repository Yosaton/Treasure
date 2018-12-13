class SessionsController < ApplicationController

  def new #the view page
  end

  def create #where user actualyl logs in
    user = User.find_by(email: params[:session][:email].downcase)
    #authenticate from bcrypt
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
  
   def create_from_omniauth
    #requests a token // auth hash the details
    #here our app receives all of our details of user
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)
    #authentication find that user if hes logged in already, OR create him if he hasn't
    # if: previously already logged in with OAuth
    # if theres already a user with that token
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      # @next = edit_user_path(user)
      @next = user_path(user.id)
      @notice = "Signed in!"
    # else: user logs in with OAuth for the first time
    else
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      #send them to user profile page when they log in
      @next = user_path(user.id)
      @notice = "User created. Please confirm or edit details"
    end
  
    log_in(user)
    redirect_to @next, :notice => @notice
  end






end

