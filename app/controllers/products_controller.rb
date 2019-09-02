class ProductsController < ApplicationController
  before_action :error , only:[:show]

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
    
    @products_ladies = Product.where(category_id:1).order("id DESC").limit(4)
    @products_mens = Product.where(category_id:212).order("id DESC").limit(4)
    @products_electricals = Product.where(category_id:907).order("id DESC").limit(4)
    @products_toys = Product.where(category_id:794).order("id DESC").limit(4)

  end

  def error  

  end


end