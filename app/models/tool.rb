class Tool < ApplicationRecord
  belongs_to :user

  has_many :reservartions, dependent: :destroy

  validates :name, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :price, presence: true
end
