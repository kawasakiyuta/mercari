class ProductsController < ApplicationController
  require "payjp"

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

  def confirmation
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
    render layout: 'index'
  end

  def buy
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:id]) # 購入した際の情報を元に引っ張ってくる
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
      amount: @product.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、jpyをcurrencyへ入れる
      if @product.update(state: 1, buyer_id: current_user.id)
        flash[:notice] = '購入が完了しました。'
        redirect_to controller: "products", action: 'show'
      else
        flash[:alert] = '購入できませんでした。'
        redirect_to controller: "products", action: 'show'
      end
    end
  end

  def error  
  end

end