class ProductsController < ApplicationController
  # before_action :error , only:[:show]

  def show
  end

  def new
    @addresses = Address.all
  end
  
  def index
    
  end

  def error  
    # unless 商品があるか
    #   redirect_to('products/error')
    # end
    # サーバーサイド実装後修正
  end


  def destroy
    product = Product.find(params[:id])
    if product.user_id == current_user.id
      product.destroy
      redirect_to action: :index
    end
  end

end