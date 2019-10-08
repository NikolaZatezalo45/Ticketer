class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :purchaser, class_name: 'User', optional: true
  validates :number, :price, presence: true
end
