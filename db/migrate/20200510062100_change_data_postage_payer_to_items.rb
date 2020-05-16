class ChangeDataPostagePayerToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :postage_payer, :string
  end
end
