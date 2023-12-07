class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.references :order, null: false, foreign_key: true
      
      t.references :birdhouse, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :price

      t.timestamps
    end
  end
end
