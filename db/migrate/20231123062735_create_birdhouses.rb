class CreateBirdhouses < ActiveRecord::Migration[7.0]
  def change
    create_table :birdhouses do |t|
      t.string :material
      t.string :color
      t.string :style
      t.string :roof_design
      t.string :size
      t.string :artistic_details
      t.decimal :price

      t.timestamps
    end
  end
end
