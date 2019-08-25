class ItemsController < ApplicationController

  def new
    @addresses = Address.all
    render layout: 'index'
  end
  
  def index
    
  end

end
