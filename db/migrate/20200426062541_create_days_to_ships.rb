class CreateDaysToShips < ActiveRecord::Migration[5.2]
  def change
    create_table :days_to_ships do |t|
      t.integer :days_to_ship_id
      t.string :days

      t.timestamps
    end
  end
end
