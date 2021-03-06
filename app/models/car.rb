class Car < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :model, :year, :city, :description, :price, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  has_many :reviews, dependent: :destroy

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  include PgSearch::Model
  pg_search_scope :search,
    against: [:title, :model, :description, :year, :city],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
