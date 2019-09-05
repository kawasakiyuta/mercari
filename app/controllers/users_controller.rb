class UsersController < ApplicationController

  def logout
  end

  def identification
    @addresses = Address.all
  end

  def mypage
  end

   

  def index
    render layout: 'index'
  end

  def new
    render layout: 'index'
  end

  def login
    render layout: 'index'
  end

  def edit
  end
  
  def address
    @addresses = Address.all
    render layout: 'index'
  end

  def complete
    render layout: 'index'
    @users = User.new(user_params)
    @users.save
    redirect_to users_path
  end

  def pay
    render layout: 'index'
  end

  def telephone
    render layout: 'index'

  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

end
