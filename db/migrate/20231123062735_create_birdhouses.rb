class CreateBirdhouses < ActiveRecord::Migration[7.0]
  def change
    create_table :birdhouses do |t|
      t.string :Material
      t.string :Color
      t.string :Style
      t.string :Roof_design
      t.string :Size
      t.string :Artistic_detail
      t.decimal :Price

      t.timestamps
    end
  end
end
