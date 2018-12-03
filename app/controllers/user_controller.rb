class UserController < ApplicationController
    def index
      @users = User.all
    end
  
    def new
      @user = User.new
    end
  
    def edit
    end
  
    def create
      user = User.new(user_params)
      if user && user.save do
        session[:user_id] = user.id
        flash[:success] = "Successfully created user!"
        redirect_to root_path
      end
      else
        flash[:warning] = "Invalid email or password!"
        redirect_to root_path 
      end
    end
  
    def show
      @listings = Listing.all
      @user = User.find(params[:id])
    end
  
    def update
    end
  
    def destroy
    end
  
    # def login
    #   user = User.find_by(email: params[:user][:email])
    #   byebug
    #   if user && user.authenticate(params[:user][:password])
    #     # @message = "Login successful! Welcome, #{user.first_name)}!"
    #     session[:user_id] = user.id #sets the session to user_id upon login
    #     session[@message] = "hey buddy"
    #     redirect_to "users/#{user.id}"
    #   else
    #     @message = "Login unsuccessful, please try again!"
    #     redirect_to root_path 
    #   end
    # end
  
    private
      def user_params
          params.require(:user).permit(:first_name, :last_name , :email, :phone_number, :avatar, :password)
      end
  
  end
  