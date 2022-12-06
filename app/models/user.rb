class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :groups
  has_many :events, through: :favorites
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :handle, presence: true

  def favorite_event?(event)
    self.favorites.find_by(event: event).present?
  end
end
