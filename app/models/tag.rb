class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :taggings
  has_many :tickets, through: :taggings
  scope :most_used, -> { order(taggings_count: :desc).first }
end
