class ProductsController < ApplicationController
  # before_action :error , only:[:show]
  require "payjp"
  before_action :specific_product, only: [:show, :confirmation, :buy, :destroy]

  def show
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
    # if product.user_id == current_user.id
    @product.destroy
      # redirect_to action: :index
    # end
    redirect_to "mypage_users"
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

  def error  
  end

  def specific_product
    @product = Product.find(params[:id])
  end

end
