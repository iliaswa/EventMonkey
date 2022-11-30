class Event < ApplicationRecord
  has_many :favorites, dependent: :destroy
  validates :name, :location, :date_details, :venue, :url, :category, presence: true
end
