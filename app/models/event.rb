class Event < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', :foreign_key => 'creator_id'
  has_many :tickets
  validates :name, :number_of_tickets, :date, :category_id, :description, presence: true

  scope :upcomingEvents, -> {where("date>=?", (Date.today)) }
  scope :pastEvents, -> {where("date<?", (Date.today)) }
end
