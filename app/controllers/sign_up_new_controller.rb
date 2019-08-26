class SignUpNewController < ApplicationController
  layout 'index'

  def index
    # @registrations = Registration.all
  end

  def telephone
    @telephone = Telephone.all
  end
  
  def address
    @addresses = Address.all
  end

  def pay
  end

  def create
  end

end
