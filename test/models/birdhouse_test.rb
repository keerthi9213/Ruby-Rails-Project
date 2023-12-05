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
require "test_helper"

class BirdhouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
