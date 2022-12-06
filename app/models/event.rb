class Event < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :orders
  validates :name, :location, :date_details, :venue, :url, :category, presence: true

  geocoded_by :venue
  after_validation :geocode, if: :will_save_change_to_location?
end
