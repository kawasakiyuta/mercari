class ProductsController < ApplicationController
  require "payjp"
  before_action :specific_product, only: [:show, :update, :edit, :confirmation, :buy, :destroy]

  def show
    unless @product.sold 
      redirect_to('/products/error')
    end
  end

  def new
    if current_user 
      @product = Product.new
      @product.images.build
      @addresses = Address.all

      @category_parent_array = []
      parent_origin = [value: 0, name: "---"]
      @category_parent_array << parent_origin
      Category.where(ancestry: nil).each do |parent|
        parent = [value: parent.id, name: parent.name]
        @category_parent_array << parent
      end
      render layout: 'index'
    else
      redirect_to  new_user_session_path and return
    end
  end

  def edit
    # @product = Product.find(params[:id])
    # @product.images.build
    @addresses = Address.all
    @root_category = @product.category
    @child_category = Category.find(@product.child_category)
    @grandchild_category = Category.find(@product.grandchild_category)

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
    if current_user == nil
      redirect_to  new_user_session_path and return
    end
    if @product.user_id == current_user.id || @product.buyer_id != 0
      redirect_to products_path and return
    end
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

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to mypage_users_path
    else
     redirect_to action: :index
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
    @category_children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.json
    end
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
    respond_to do |format|
      format.json
    end
  end

  def create
    @product = Product.new(product_parameter)
    if @product.save
      redirect_to root_path
    else
      category = Category.find(product_parameter[:category_id])
      @category_parent_array = []
      parent_origin = [value: category.id, name:category.name]
      @category_parent_array << parent_origin
      @addresses = Address.all
      @product.images.build
      render action: 'new'
    end
  end

  def update
    if @product.update(update_product_parameter)
      category = Category.find(update_product_parameter[:category_id])
      @category_parent_array = []
      parent_origin = [value: category.id, name:category.name]
      @category_parent_array << parent_origin
      @addresses = Address.all
      redirect_to product_path
    else
      render 'edit'
    end
  end

  def error
    render layout: 'index'
  end

  def product_parameter
    params.require(:product).permit(:name, :state, :price, :sold, :user_id, :buyer_id, :cost_bearer, :delivery_method, :address_id, :category_id, :day_to_ship, :child_category, :grandchild_category, :description, images_attributes: [:image, :id])   #.merge(user_id: current_user.id)#後で使い為のメモ書きです。
  end

  def update_product_parameter
    params.require(:product).permit(:name, :state, :price, :sold, :user_id, :buyer_id, :cost_bearer, :delivery_method, :address_id, :category_id, :day_to_ship, :child_category, :grandchild_category, :description, images_attributes: [:image, :id, :_destroy])   #.merge(user_id: current_user.id)#後で使い為のメモ書きです。
  end

  def specific_product
    @product = Product.find(params[:id])
  end
end
