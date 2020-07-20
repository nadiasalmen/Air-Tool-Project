class Review < ApplicationRecord
  belongs_to :tool
  validates :content, presence: true
end
