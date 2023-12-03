class AddPaymentDetailsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :card_number, :bigint
    add_column :orders, :card_expiry, :string
    add_column :orders, :card_cvv, :integer
    add_column :orders, :cardholder_name, :string
  end
end
