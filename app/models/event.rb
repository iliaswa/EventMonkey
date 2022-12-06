class Event < ApplicationRecord
  has_many :favorites, dependent: :destroy
  validates :name, :location, :date_details, :venue, :url, :category, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
