class Car < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  validates :title, :model, :year, :city, :description, :price, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  include PgSearch::Model
  pg_search_scope :search,
    against: [:title, :model, :description, :year],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
