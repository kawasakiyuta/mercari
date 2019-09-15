class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay #クレジットカード登録（payjpとCardのデータベース作成を実施）
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def index
  end

  def delete #PayjpとCardデータベースの削除
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "index"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
      redirect_to action: "index"
    end
  end

  def show #Cardのデータをpayjpに送り情報を取り出す
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
  def buy
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:product_id]) # 購入した際の情報を元に引っ張ってくる
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
      amount: @product.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、jpyをcurrencyへ入れる
      if @product.update(status: 1, buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to controller: "products", action: 'show'
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "products", action: 'show'
      end
    end
  end
  
end
