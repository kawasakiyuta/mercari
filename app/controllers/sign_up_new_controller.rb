class SignUpNewController < ApplicationController
  layout 'index'

  def index
  end

  def telephone
  end
  
  def address
    @addresses = Address.all
  end

  def pay
  end

  def create
  end

end
