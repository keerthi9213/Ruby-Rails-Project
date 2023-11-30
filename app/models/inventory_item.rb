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
class InventoryItem < ApplicationRecord
    validates :name, :description, :quantity, :price, presence: true
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
    validates :price, numericality: { greater_than: 0 }
end
