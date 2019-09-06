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

  def search
    @searchword = params[:keyword]
      if @searchword.present?
        @products_search =Product.sorted.where("name LIKE ?" , "%#{params[:keyword]}%").page(params[:page]).per(1)
      else
        @products_search =Product.all.sorted.page(params[:page]).per(20)
      end
  end



  def error  

  end

end
