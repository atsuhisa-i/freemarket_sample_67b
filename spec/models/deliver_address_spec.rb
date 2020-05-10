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
  end
end