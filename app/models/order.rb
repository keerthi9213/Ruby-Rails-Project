# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  birdhouse_ids    :text
#  card_cvv         :integer
#  card_expiry      :string
#  card_number      :bigint
#  card_type        :string
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
  has_many :birdhouses
  has_many :line_items
  has_many :birdhouses, through: :line_items
  validates :shipping_address, :cardholder_name, :card_number, :card_expiry, :card_cvv, presence: true
  validates :total_cost, numericality: true
  validates :card_number, format: { with: /\A\d{16}\z/, message: "must be 16 digits" }
  validates :card_cvv, format: { with: /\A\d{3,4}\z/, message: "must be 3 or 4 digits" }
  validates :card_type, inclusion: { in: ['VISA', 'MC', 'AMEX'] }

end
