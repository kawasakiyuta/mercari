class ProductsController < ApplicationController
  def show
  end
  

  def new
    @addresses = Address.all
  end
  
  def index
    
  end

end