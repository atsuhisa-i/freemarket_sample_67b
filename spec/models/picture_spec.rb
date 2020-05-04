require 'rails_helper'

describe Picture, type: :model do
  describe '#create' do
    it "pictureが1枚以上あれば登録できること" do
      picture = build(:picture)
      expect(picture).to be_valid
    end

    it "pictureが空ならNG" do
      picture = build(:picture, image: nil)
      picture.valid?
      expect(picture.errors[:image]).to include("can't be blank")
    end

    it "itemが空ならNG" do
      picture = build(:picture, item_id: nil)
      picture.valid?
      expect(picture.errors[:item]).to include("can't be blank")
    end
  end
end