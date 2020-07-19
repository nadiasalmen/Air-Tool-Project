class Tool < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  geocoded_by :adress
  after_validation :geocode, if: :will_save_change_to_adress?

  validates :name, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :price, presence: true
end
