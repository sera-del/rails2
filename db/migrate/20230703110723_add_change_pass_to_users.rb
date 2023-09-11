class AddChangePassToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :change_pass, :string
  end
end
