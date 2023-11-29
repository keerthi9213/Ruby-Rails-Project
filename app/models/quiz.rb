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
class Quiz < ApplicationRecord
    # Add validations for presence or numericality as needed
    belongs_to :user
    validates :city, presence: true
    validates :temperature, presence: true
    validates :number_of_birds, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :number_of_species, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    # Add more validations according to your business logic
end
  