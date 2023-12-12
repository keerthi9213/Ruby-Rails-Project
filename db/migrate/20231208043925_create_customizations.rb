class CreateCustomizations < ActiveRecord::Migration[7.0]
  def change
    create_table :customizations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :birdhouse, null: false, foreign_key: true
      
      t.text :design_details

      t.timestamps
    end
  end
end
