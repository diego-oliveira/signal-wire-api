class Ticket < ApplicationRecord
  validates :title, :user_id, presence: true
  validate :validate_tags

  has_many :taggings
  has_many :tags, through: :taggings

  def validate_tags
    errors.add(:tags, "Max of five tags exceeded") if tags.size > 5
  end
end
