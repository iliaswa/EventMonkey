class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :groups, through: :favorite_groups
end
