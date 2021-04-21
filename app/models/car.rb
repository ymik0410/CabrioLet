class Car < ApplicationRecord
  belongs_to :user
  validates :title, :model, :year, :city, :description, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
