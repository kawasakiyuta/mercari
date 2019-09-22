class ProductsController < ApplicationController
  require "payjp"
  before_action :specific_product, only: [:show, :confirmation, :buy]

  def show
    unless @product.sold 
      redirect_to('/products/error')
    end
    
  end

  def new
    @product = Product.new
    @product.images.build
    @addresses = Address.all

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    
    render layout: 'index'
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
    card = Card.where(user_id: current_user.id).first
    if  card.blank?
      redirect_to new_card_path
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      render layout: 'index'
    end
  end

  def buy
    card = Card.where(user_id: current_user.id).first
    customer = Payjp::Customer.retrieve(card.customer_id)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    amount: @product.price, #支払金額
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、jpyをcurrencyへ入れる
    @product.state = 1
    @product.buyer_id = current_user.id
    if @product.save
      flash[:notice] = '購入が完了しました。'
      redirect_to controller: "products", action: 'show'
    else
      flash[:alert] = '購入できませんでした。'
      redirect_to controller: "products", action: 'show'
    end
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
  end

  def product_parameter
    params.require(:product).permit(:name, :state, :price, :sold, :user_id, :buyer_id, :cost_bearer, :delivery_method, :delivery_souce, :category, :day_to_ship)  #.merge(user_id: current_user.id)
  end

  def specific_product
    @product = Product.find(params[:id])
  end

end
