# == Schema Information
#
# Table name: line_items
#
#  id           :bigint           not null, primary key
#  price        :decimal(, )
#  quantity     :integer          default(1)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  birdhouse_id :bigint           not null
#  order_id     :bigint           not null
#
# Indexes
#
#  index_line_items_on_birdhouse_id  (birdhouse_id)
#  index_line_items_on_order_id      (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (birdhouse_id => birdhouses.id)
#  fk_rails_...  (order_id => orders.id)
#
require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
