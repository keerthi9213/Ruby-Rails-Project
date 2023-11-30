class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :shipping_name
      t.string :shipping_address
      t.string :contact_number
      t.string :credit_card_number
      t.string :credit_card_expiry_date
      t.string :credit_card_cvv

      t.timestamps
    end
  end
end
