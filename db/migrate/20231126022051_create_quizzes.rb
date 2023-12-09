class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :city
      t.string :temperature
      t.integer :number_of_birds
      t.integer :number_of_species
      t.text :species

      t.timestamps
    end
  end
end
