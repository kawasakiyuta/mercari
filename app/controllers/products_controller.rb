class ProductsController < ApplicationController
  # before_action :error , only:[:show]

  def show
    
  end

  def new
    @addresses = Address.all
  end
  
  def index
    @name =  "いぬ,俺いぬ、飛んでるいぬ、途中から消える途中から"
    @price = "33333333"
    @image = "https://scontent-lga3-1.cdninstagram.com/vp/62f3f45922905dafafe577813b3498d5/5E10DE4F/t51.2885-15/e35/c150.0.601.601a/66607752_161037741733443_119877856891125158_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com"
  end

  def error  
    # unless 商品があるか
    #   redirect_to('products/error')
    # end
    # サーバーサイド実装後修正
  end


end