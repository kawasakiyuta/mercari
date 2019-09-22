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

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    
    render layout: 'index'
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @product = Product.new(product_parameter)
    @category_parent_array = ["---"]
    @addresses = Address.all

    # render plain: params[:product].inspect
    # render plain: @product.errors.inspect
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
    params.require(:product).permit(:name, :state, :price, :sold, :user_id, :buyer_id, :cost_bearer, :delivery_method, :delivery_souce, :category, :day_to_ship)  #.merge(user_id: current_user.id)
  end

end