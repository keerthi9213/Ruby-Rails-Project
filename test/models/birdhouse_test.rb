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
#  roof_design      :string
#  size             :string
#  style            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class BirdhouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
