class Car < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  validates :title, :model, :year, :city, :description, :price, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
