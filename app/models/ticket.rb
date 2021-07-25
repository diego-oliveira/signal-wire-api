class Ticket < ApplicationRecord
  validates :title, :user_id, presence: true
end
