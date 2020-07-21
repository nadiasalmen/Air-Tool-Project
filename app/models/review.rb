class Review < ApplicationRecord
  belongs_to :tool
  belongs_to :user
  validates :content, presence: true
end
