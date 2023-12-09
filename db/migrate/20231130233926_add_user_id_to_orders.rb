class AddUserIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :user, null: false, foreign_key: true
    add_column :orders, :birdhouse_ids, :text
  end
end
