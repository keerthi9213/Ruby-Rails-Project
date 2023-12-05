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
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
