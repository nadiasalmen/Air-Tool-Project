class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :tool
  has_one :owner, through: :tool, class_name: 'User', source: :user

  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_start, presence: true
  validate :end_start_validate
  validate :owner_validate

  def end_start_validate
    return if end_start.nil? || start_date.nil?

    if end_start < start_date
      errors.add(:end_start, "must be greater than start date")
    end
  end

  def owner_validate
    errors.add(:owner, "is the same as user") unless owner != user
  end
end

