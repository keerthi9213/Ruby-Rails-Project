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
#  user_id           :bigint
#
# Indexes
#
#  index_quizzes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
