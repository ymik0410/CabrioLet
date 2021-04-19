class Car < ApplicationRecord
  belongs_to :user
  validates :title, :model, :year, :city, :description, presence: true
end
