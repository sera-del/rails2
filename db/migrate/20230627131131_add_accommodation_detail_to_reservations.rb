class AddAccommodationDetailToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :accommodation_detail, :text
  end
end
