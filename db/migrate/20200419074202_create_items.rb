class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :explanation, null: false
      t.string :size, null: false
      t.references :category, null: false, foreign_key: true
      t.references :brand, foreign_key: true
      t.integer :condition, null: false
      t.boolean :postage_payer, null: false
      t.string :shipping_origin, null: false
      t.integer :days_to_ship, null: false
      t.integer :price, null: false
      t.integer :trading_status, null: false, default: 0
      t.timestamps
    end
  end
end
