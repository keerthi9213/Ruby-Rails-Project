class AddLikesToBirdhouses < ActiveRecord::Migration[7.0]
  def change
    add_column :birdhouses, :likes, :integer, default: 10
    add_column :birdhouses, :quantity, :integer, default: 5
  end
end
