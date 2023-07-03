class AddUserImgToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_img, :string
  end
end
