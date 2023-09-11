class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :accommodation
      t.text :accommodation_detail
      t.integer :price
      t.string :address
      t.string :img
      t.date :check_in
      t.date :check_out
      t.string :number_of_people

      t.timestamps
    end
  end
end
