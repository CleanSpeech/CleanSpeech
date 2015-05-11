class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook, :string
    add_column :users, :uid, :string
  end
end
