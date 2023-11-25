# == Schema Information
#
# Table name: carts
#
#  id           :bigint           not null, primary key
#  shipping_fee :decimal(, )
#  taxes        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :birdhouses, through: :cart_items

  def add_birdhouse(birdhouse)
    current_item = cart_items.find_by(birdhouse_id: birdhouse.id)
    if current_item
      current_item.quantity += 1
    else
      cart_items.build(birdhouse: birdhouse, quantity: 1)
    end
    current_item.save
    current_item
  end

  def total_cost
    items_cost = cart_items.to_a.sum(&:total_price)
    items_cost + shipping_fee + taxes
  end
end
