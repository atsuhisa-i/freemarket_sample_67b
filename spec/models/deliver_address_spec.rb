require 'rails_helper'
describe DeliverAddress, type: :model do
  describe '#create' do
    it "family_nameがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, family_name: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:family_name]).to include("can't be blank")
    end

    it "first_nameがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, first_name: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:first_name]).to include("can't be blank")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, family_name_kana: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:family_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, first_name_kana: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:first_name_kana]).to include("can't be blank")
    end

    it "family_nameが全角である場合は登録できること" do
      deliver_address = build(:deliver_address, family_name: "田中")
      deliver_address.valid?
      expect(deliver_address.errors[:family_name]).to include("全角で入力してください")
    end

    it "family_nameが全角でない場合は登録できないこと" do
      deliver_address = build(:deliver_address, family_name: "tanaka")
      deliver_address.valid?
      expect(deliver_address.errors[:family_name]).to include("全角で入力してください")
    end

    it "first_nameが全角である場合は登録できること" do
      deliver_address = build(:deliver_address, first_name: "太郎")
      deliver_address.valid?
      expect(deliver_address.errors[:first_name]).to include("全角で入力してください")
    end

    it "first_nameが全角でない場合は登録できないこと" do
      deliver_address = build(:deliver_address, first_name: "tarou")
      deliver_address.valid?
      expect(deliver_address.errors[:first_name]).to include("全角で入力してください")
    end

    it "family_name_kanaが全角である場合は登録できること" do
      deliver_address = build(:deliver_address, family_name_kana: "タナカ")
      deliver_address.valid?
      expect(deliver_address.errors[:family_name_kana]).to include("全角で入力してください")
    end

    it "family_name_kanaが全角でない場合は登録できないこと" do
      deliver_address = build(:deliver_address, family_name_kana: "ﾀﾅｶ")
      deliver_address.valid?
      expect(deliver_address.errors[:family_name_kana]).to include("全角で入力してください")
    end

    it "first_name_kanaが全角である場合は登録できること" do
      deliver_address = build(:deliver_address, first_name_kana: "タロウ")
      deliver_address.valid?
      expect(deliver_address.errors[:first_name_kana]).to include("全角で入力してください")
    end

    it "first_name_kanaが全角でない場合は登録できないこと" do
      deliver_address = build(:deliver_address, first_name_kana: "tarou")
      deliver_address.valid?
      expect(deliver_address.errors[:first_name_kana]).to include("全角で入力してください")
    end

    it "zip_codeがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, zip_code: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:zip_code]).to include("can't be blank")
    end

    it "prefectureがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, prefecture: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:prefecture]).to include("can't be blank")
    end

    it "郵便番号７桁必要" do
      deliver_address = build(:deliver_address, zip_code: "1111111")
      deliver_address.valid?
      expect(deliver_address).to be_valid
    end

    it "郵便番号６桁以下は登録できないこと" do
      deliver_address = build(:deliver_address, zip_code: "111111")
      deliver_address.valid?
      expect(deliver_address.errors[:zip_code]).to include("is too short (minimum is 6 characters)")
    end

    
  end
end