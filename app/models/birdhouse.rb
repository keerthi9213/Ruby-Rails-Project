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
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Birdhouse < ApplicationRecord
end
