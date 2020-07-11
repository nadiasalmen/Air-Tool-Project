class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  has_many :users, through: :tools

  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
