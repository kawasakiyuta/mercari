class UsersController < ApplicationController
   

  def index
    render layout: 'index'
  end

  def new
  end

  def login
  end

  def edit
  end
  
  def address
    @addresses = Address.all
    render layout: 'index'
  end

  def complete
    render layout: 'index'
  end

  def pay
    render layout: 'index'
  end

  def telephone
    render layout: 'index'
  end

end
