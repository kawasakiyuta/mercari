class ProductsController < ApplicationController
  # before_action :error , only:[:show]
  
  def index
  end

  def show
  end

  def new
    @addresses = Address.all
    @product = Product.new
    @product.images.build
    @addresses = Address.all
    render layout: 'index'
  end

  def create
    @product = Product.new(product_parameter)
    respond_to do |format|
      if @product.save
          params[:images][:image].each do |image|
            @product.images.create(image: image, product_id: @product.id)
          end
        format.html{redirect_to root_path}
      else
        @product.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def error  
    # unless 商品があるか
    #   redirect_to('products/error')
    # end
    # サーバーサイド実装後修正
  end

  def product_parameter
    params.require(:product).permit(:name, :description, :first_category_id, :second_category_id, :third_category_id, :size, :product_status, :delivery_fee, :prefecture_id, :lead_time, :price, :transaction_status, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end

end