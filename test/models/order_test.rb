# == Schema Information
#
# Table name: orders
#
#  id                      :bigint           not null, primary key
#  contact_number          :string
#  credit_card_cvv         :string
#  credit_card_expiry_date :string
#  credit_card_number      :string
#  shipping_address        :string
#  shipping_name           :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
