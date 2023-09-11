class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :img
      t.string :accommodation
      t.text :introduction
      t.integer :price
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
