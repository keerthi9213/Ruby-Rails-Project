# == Schema Information
#
# Table name: inventory_items
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  price       :decimal(, )
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class InventoryItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
