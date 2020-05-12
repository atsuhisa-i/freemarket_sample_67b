require 'rails_helper'
describe User, type: :model do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    
    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
    
    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailに＠がない場合は登録できない" do
      user = build(:user, email: "zzzzzzz")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailに＠がある場合は登録できる" do
      user = build(:user, email: "codetest112@example.com")
      user.valid?
      expect(user).to be_valid
    end

    it "family_name_kanaが全角カタカナの場合は登録できること" do
      user = build(:user, family_name_kana: "タナカ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナで入力してください")
    end

    it "family_name_kanaが全角カタカナでない場合は登録できないこと" do
      user = build(:user, family_name_kana: "tanaka")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナで入力してください")
    end

    it "passwordフォーマット外だと登録できないこと" do
      user = build(:user, password: "000", password_confirmation: "000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "passwordフォーマットがただしければ登録できること" do
      user = build(:user, password: "zxcv000", password_confirmation: "zxcv000")
      user.valid?
      expect(user).to be_valid
    end
  end
end