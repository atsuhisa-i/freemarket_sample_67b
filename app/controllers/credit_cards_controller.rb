class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card, only: [:destroy, :show]

  def new
    credit_card = CreditCard.where(user_id: current_user.id )
  end

  def create #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to new_user_credit_card_path
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to users_path
      else
        redirect_to user_credit_cards_path
      end
    end
  end

  def destroy #PayjpとCardデータベースを削除
    @credit_card = current_user.credit_card
    if @credit_card.destroy
      redirect_to new_user_credit_card_path
    end
  end
 
  def show #Cardのデータpayjpに送り情報を取り出します
    @credit_card = CreditCard.where(user_id: current_user.id).first
    if @credit_card.blank?
      redirect_to new_user_credit_card_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)
    end
  end

  private

  def set_card
    @card = CreditCard.where(user_id: current_user.id).first
  end
end
