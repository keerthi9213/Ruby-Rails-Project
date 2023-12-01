class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :items
      t.decimal :total_cost
      t.string :shipping_address
      t.string :payment_details

      t.timestamps
    end
  end
end
