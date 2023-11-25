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
require "test_helper"

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
