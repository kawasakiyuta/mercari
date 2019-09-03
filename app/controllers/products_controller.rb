class ProductsController < ApplicationController

 def show
    @product = Product.find(params[:id])

    unless @product.sold 
      redirect_to('/products/error')
    end
    
  end

  def new
    @addresses = Address.all

  end
  
  def index

    @products_ladies = Product.adjust.active(1)
    @products_mens = Product.adjust.active(212)
    @products_electricals = Product.adjust.active(907)
    @products_toys = Product.adjust.active(794)

  end

  def error  

  end

end