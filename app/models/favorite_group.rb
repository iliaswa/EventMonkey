class FavoriteGroup < ApplicationRecord
  belongs_to :group
  belongs_to :favorite
  validates :favorite_id, uniqueness: { scope: :group_id }
end
