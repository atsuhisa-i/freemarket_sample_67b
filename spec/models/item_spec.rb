require 'rails_helper'

describe Item, type: :model do
  describe '#create' do
    it "全て揃っている時保存できる" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "sellerが空ならNG" do
      item = build(:item, seller_id: nil)
      item.valid?
      expect(item.errors[:seller]).to include("must exist")
    end

    it "nameが空ならNG" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "explanationが空ならNG" do
      item = build(:item, explanation: nil)
      item.valid?
      expect(item.errors[:explanation]).to include("can't be blank")
    end

    it "sizeが空ならNG" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end

    it "categoryが空ならNG" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category]).to include("can't be blank")
    end

    it "brandが空でも登録できること" do
      item = build(:item, brand_id: nil)
      expect(item).to be_valid
    end

    it "conditionが空ならNG" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "postage_payerが空ならNG" do
      item = build(:item, postage_payer: nil)
      item.valid?
      expect(item.errors[:postage_payer]).to include("can't be blank")
    end

    it "shipping_originが空ならNG" do
      item = build(:item, shipping_origin: nil)
      item.valid?
      expect(item.errors[:shipping_origin]).to include("can't be blank")
    end

    it "days_to_shipが空ならNG" do
      item = build(:item, days_to_ship: nil)
      item.valid?
      expect(item.errors[:days_to_ship]).to include("can't be blank")
    end

    it "priceが空ならNG" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "trading_statusが空ならNG" do
      item = build(:item, trading_status: nil)
      item.valid?
      expect(item.errors[:trading_status]).to include("can't be blank")
    end

    it "nameが41文字以上であればNG" do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "nameが40文字以下であれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "explanationが1001文字以上であればNG" do
      item = build(:item, explanation: "a" * 1001)
      item.valid?
      expect(item.errors[:explanation]).to include("is too long (maximum is 1000 characters)")
    end

    it "explanationが1000文字以下であれば登録できること" do
      item = build(:item, explanation: "a" * 300)
      expect(item).to be_valid
    end

    it "priceが300円未満であればNG" do
      item = build(:item, price: 200)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than 299") 
    end

    it "priceが10000000以上であればNG" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than 10000000")
    end

    it "priceが300円以上で9999999円以下であれば登録できること" do
      item = build(:item, price: 1000)
      expect(item).to be_valid
    end
  end
end