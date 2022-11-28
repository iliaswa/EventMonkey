class Event < ApplicationRecord
  has_many :favorites, dependent: :destroy
  validates :name, :description, :location, :date_details, :price, :venue, :url, :category, :lng, :lat, presence: true
end
