class BuyersController < ApplicationController
  #require 'payjp'
  before_action :set_item

  def index
    # if @card.blank?
    #   redirect_to クレジットカードの登録画面に遷移
    # else
    #   Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
    #   customer = Payjp::Customer.retrieve(@card.customer_id) 
    #   @default_card_information = customer.cards.retrieve(@card.card_id)
    # end
    @deliver_address = DeliverAddress.where(user_id: current_user.id).first
  end

  def pay
  #   Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
  #   Payjp::Charge.create(
  #     :amount => @item.price,
  #     :customer => @card.customer_id,
  #     :currency => 'jpy',
  #   )
    redirect_to done_item_buyers_path
  end

  def done
  
  end

end

private

def set_item
  @item = Item.find(params[:item_id])
end