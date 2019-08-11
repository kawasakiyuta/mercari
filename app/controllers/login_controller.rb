class LoginController < ApplicationController
  
    def index
    end
  
    def new
      @user = User.new
    end
  
    def create
      # @user = User.new(params[:user])
      # @user.save
      # redirect_to new_user_path
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name)
    end
  
end
