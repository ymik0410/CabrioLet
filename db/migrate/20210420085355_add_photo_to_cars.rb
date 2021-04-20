class AddPhotoToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :photo, :string
  end
end
