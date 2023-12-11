# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  feedback   :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reviews_on_order_id  (order_id)
#  index_reviews_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (user_id => users.id)
#
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :order

  # Validations
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
  validates :feedback, presence: true

end
