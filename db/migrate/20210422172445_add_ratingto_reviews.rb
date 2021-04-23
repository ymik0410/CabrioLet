class AddRatingtoReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :rating, :integer
  end
end
