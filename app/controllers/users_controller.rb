class UsersController < ApplicationController
  def logout
  end

  def identification
    @addresses = Address.all
  end

  def mypage
  end

end
