class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :temperature
      t.integer :number_of_birds
      t.integer :number_of_species
      # Add other fields as necessary

      t.timestamps
    end
  end
end
