class ProductsController < ApplicationController
  # before_action :error , only:[:show]

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
        @products_search =Product.sorted.where("name LIKE ?" , "%#{params[:keyword]}%").page(params[:page]).per(4)
      else
        @products_search =Product.all.sorted.page(params[:page]).per(20)
      end
  end

  def confirmation
    render layout: 'index'
  end

  def destroy
    product = Product.find(params[:id])
    if product.user_id == current_user.id
      product.destroy
      redirect_to action: :index
    end
  end

  def error  
  end

end
