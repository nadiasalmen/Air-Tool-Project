class Tool < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :photo

  include PgSearch
  pg_search_scope :search_by_name, against: [:name]

  geocoded_by :adress
  after_validation :geocode, if: :will_save_change_to_adress?
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :price, presence: true
end
