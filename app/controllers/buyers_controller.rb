class BuyersController < ApplicationController
  require 'payjp'
  before_action :set_item
  before_action :set_card, only: [:index, :pay]

  def index
    if @credit_card.blank?
      redirect_to new_user_credit_card_path(user_id: current_user.id)
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@credit_card.customer_id) 
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)
    end
    @deliver_address = DeliverAddress.where(user_id: current_user.id).first
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => @credit_card.customer_id,
      :currency => 'jpy',
    )
    redirect_to done_item_buyers_path
  end

  def done
    @item.update( buyer_id: current_user.id)
  end

end

private

def set_item
  @item = Item.find(params[:item_id])
end

def set_card
  @credit_card = CreditCard.where(user_id: current_user.id).first
end