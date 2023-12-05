# == Schema Information
#
# Table name: birdhouses
#
#  id              :bigint           not null, primary key
#  Artistic_detail :string
#  Color           :string
#  Material        :string
#  Price           :decimal(, )
#  Roof_design     :string
#  Size            :string
#  Style           :string
#  likes           :integer          default(10)
#  quantity        :integer          default(5)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Birdhouse < ApplicationRecord

    #belongs_to :order
    has_many :line_items
    has_many :orders, through: :line_items
    validates :quantity, numericality: {greater_than_or_equal_to: 0}
    has_many :cart_items
    has_many :carts, through: :cart_items

end
