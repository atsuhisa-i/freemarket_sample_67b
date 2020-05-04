class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.text :explanation, null: false
      t.string :size, null: false
      t.references :category, null: false, foreign_key: true
      t.references :brand, foreign_key: true
      t.string :condition, null: false
      t.integer :postage_payer, null: false
      t.string :shipping_origin, null: false
      t.string :days_to_ship, null: false
      t.integer :price, null: false
      t.integer :trading_status, null: false, default: 0
      t.timestamps
    end
  end
end
