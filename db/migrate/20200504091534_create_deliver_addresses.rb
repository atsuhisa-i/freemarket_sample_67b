class CreateDeliverAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string  :family_name, null: false
      t.string  :first_name, null: false
      t.string  :family_name_kana, null: false
      t.string  :first_name_kana, null: false
      t.integer :zip_code, null: false
      t.string  :prefecture, null: false
      t.string  :municipality, null: false
      t.string  :building_name
      t.integer :phone_number
      t.timestamps
    end
  end
end
