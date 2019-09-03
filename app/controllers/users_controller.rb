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

  def create
    render layout: 'index'
  end

  def pay
    render layout: 'index'
  end

  def telephone
    render layout: 'index'

  end

  def product_detail
  end


end
