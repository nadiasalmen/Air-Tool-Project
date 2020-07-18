class Tool < ApplicationRecord
  belongs_to :user

  has_many :reservations, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :price, presence: true
end
