# == Schema Information
#
# Table name: birdhouses
#
#  id               :bigint           not null, primary key
#  artistic_details :string
#  color            :string
#  likes            :integer          default(10)
#  material         :string
#  price            :decimal(, )
#  quantity         :integer          default(5)
#  roof_design      :string
#  size             :string
#  style            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Birdhouse < ApplicationRecord
    validates :quantity, numericality: {greater_than_or_equal_to: 0}
    has_many :cart_items
    has_many :carts, through: :cart_items
    has_one_attached :figure_image
end
