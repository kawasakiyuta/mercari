class ProductsController < ApplicationController
  # before_action :error , only:[:show]
  
  def index
    
  end

  def show
  end

  def new
    @addresses = Address.all
    render layout: 'index'

  end

  def error  
    # unless 商品があるか
    #   redirect_to('products/error')
    # end
    # サーバーサイド実装後修正
  end


end