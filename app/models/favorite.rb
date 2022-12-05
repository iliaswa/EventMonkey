class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :groups, through: :favorite_groups

  validates :user_id, uniqueness: { scope: :event_id }
end
