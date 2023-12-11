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
class Quiz < ApplicationRecord
    belongs_to :user
    # Add validations for presence or numericality as needed
    belongs_to :user
    validates :city, presence: true
    validates :temperature, presence: true
    validates :number_of_birds, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :number_of_species, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    # Add more validations according to your business logic

    def calculate_results
        recommendations = []
      
        # Detailed recommendations based on temperature
        case temperature.downcase
        when 'high'
          recommendations << "Given the high temperatures, ensure the birdhouse has proper ventilation. Consider using lighter colors to reflect sunlight and heat. Consider birdhouses with proper ventilation and heat-resistant materials to protect birds from heat stress."
        when 'average'
          recommendations << "Average temperatures detected. Standard birdhouses with regular materials should be suitable, but ensure there is some shade to protect from occasional high temperatures, With average temperatures, a standard birdhouse should suffice. Ensure there is some shade to guard against heat spikes."
        when 'low'
          recommendations << "Low temperatures detected. Insulated birdhouses or those with protective lining can provide warmth for birds during cold weather. Darker colors may help absorb heat during the day."
        else
          recommendations << "Temperature data is unclear. Consult local climate guides for specific birdhouse adaptations."
        end
      
        # Detailed recommendations based on the number of birds
        case number_of_birds
        when 1
          recommendations << "With just one bird, a small, cozy birdhouse is ideal to make it feel secure."
        when 2..3
          recommendations << "For a few birds, consider a birdhouse with multiple compartments or small, separate units."
        when 4..6
          recommendations << "A moderate flock will need a larger birdhouse or several small houses spaced apart."
        when 7..10
          recommendations << "For many birds, ensure there is enough room to nest comfortably without competition. Multiple birdhouses may be necessary."
        else
          recommendations << "The number of birds is quite significant, consider creating a birdhouse community with diverse sizes and entrance types."
        end
      
        # Detailed recommendations based on the number of species
        case number_of_species
        when 1
          recommendations << "With only one species, focus on a birdhouse tailored to its specific nesting requirements."
        when 2
          recommendations << "Two species will need a birdhouse that meets both their needs, possibly with adaptable entrance sizes."
        when 3
          recommendations << "Multiple species may require a birdhouse with various compartment sizes and placement options."
        when 4
          recommendations << "With this level of diversity, consider a birdhouse complex that can cater to various nesting habits."
        when 5
          recommendations << "A high level of species diversity calls for a thoughtful approach to birdhouse design, offering a range of sizes, heights, and materials."
        else
          recommendations << "Species data is extensive. Consult with an avian expert to design a birdhouse array that can accommodate such biodiversity."
        end
      
        # Combining all recommendations into a single string.
        recommendations.join(' ')
      end
      


end
  
