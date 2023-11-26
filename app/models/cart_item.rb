# == Schema Information
#
# Table name: cart_items
#
#  id           :bigint           not null, primary key
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  birdhouse_id :bigint           not null
#  cart_id      :bigint           not null
#
# Indexes
#
#  index_cart_items_on_birdhouse_id  (birdhouse_id)
#  index_cart_items_on_cart_id       (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (birdhouse_id => birdhouses.id)
#  fk_rails_...  (cart_id => carts.id)
#
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :birdhouse

  # Set a default value for quantity
  after_initialize :set_defaults, unless: :persisted?

  def total_price
    quantity * birdhouse.price
  end
 
  private

  def set_defaults
    self.quantity ||= 1
  end
end
