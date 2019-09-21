class UsersController < ApplicationController

  def logout
  end

  def identification
    @addresses = Address.all
  end

  def mypage
  end

  def index #新規会員登録画面
    render layout: 'index'
  end

  def edit
  end
  
end
