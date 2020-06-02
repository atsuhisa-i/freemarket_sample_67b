require 'rails_helper'

describe CreditCard, type: :model do
  describe '#create' do
    it "user_id, customer_id, credit_card_idが存在すれば登録できること" do
      user = create(:user)
      credit_card = build(:credit_card, user_id: user.id)
      expect(credit_card).to be_valid
    end 

    it "user_idがない場合登録できないこと" do
      credit_card = build(:credit_card, user_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:user_id]).to include("can't be blank")
    end

    it "customer_idがない場合登録できないこと" do
      user = create(:user)
      credit_card = build(:credit_card, user_id: user.id, customer_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("can't be blank")
    end

  end
end