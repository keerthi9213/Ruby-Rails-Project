# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  card_cvv         :integer
#  card_expiry      :string
#  card_number      :bigint
#  cardholder_name  :string
#  items            :string
#  payment_details  :string
#  shipping_address :string
#  total_cost       :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :user
  validates :shipping_address, presence: true
  validates :total_cost, numericality: { greater_than_or_equal_to: 0 }
end
