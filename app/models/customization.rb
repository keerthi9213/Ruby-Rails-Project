# == Schema Information
#
# Table name: customizations
#
#  id             :bigint           not null, primary key
#  design_details :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  birdhouse_id   :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_customizations_on_birdhouse_id  (birdhouse_id)
#  index_customizations_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (birdhouse_id => birdhouses.id)
#  fk_rails_...  (user_id => users.id)
#
class Customization < ApplicationRecord
  belongs_to :user
  belongs_to :birdhouse
  has_one_attached :figure_image
  

  #validates :theme, presence: true
  #validates :design_details, presence: true, length: { minimum: 5} # Adjust validations as needed

end
