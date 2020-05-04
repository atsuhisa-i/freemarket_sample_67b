class CreatePostagePayers < ActiveRecord::Migration[5.2]
  def change
    create_table :postage_payers do |t|
      t.integer :postage_payer_id
      t.string :burden

      t.timestamps
    end
  end
end
