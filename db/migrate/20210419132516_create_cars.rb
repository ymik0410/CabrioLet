class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.text :title
      t.string :model
      t.integer :year
      t.string :city
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
