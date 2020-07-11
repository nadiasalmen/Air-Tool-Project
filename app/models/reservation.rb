class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
