class ItemsController < ApplicationController
  def new
    @addresses = Address.all
  end
  
  def index
    
  end
end
