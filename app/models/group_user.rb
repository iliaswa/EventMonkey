class GroupUser < ApplicationRecord
  has_many :users
  has_many :groups
  validates :user_id, uniqueness: { scope: :group_id }
end
