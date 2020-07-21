class Tool < ApplicationRecord
  belongs_to :user

  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :price, presence: true
end
