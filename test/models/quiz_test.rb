# == Schema Information
#
# Table name: quizzes
#
#  id                :bigint           not null, primary key
#  city              :string
#  number_of_birds   :integer
#  number_of_species :integer
#  species           :text
#  temperature       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
