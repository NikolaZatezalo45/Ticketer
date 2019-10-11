class Event < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', :foreign_key => 'creator_id'
  has_many :tickets, dependent: :destroy
  validates :name, :number_of_tickets, :date, :category_id, :description, presence: true

  scope :upcomingEvents, -> { where("date>=?", (Date.today)) }
  scope :pastEvents, -> { where("date<?", (Date.today)) }
  scope :upcomingEventsOrdered, -> { where("date>=?", (Date.today)).order(date: :asc) }

  def marketplace_tickets
    tickets.where(sold_originally: true) && tickets.where(onresell: true)
  end 

  def amount_available_tickets
    tickets.where(sold_originally: false).count
  end

  def available_tickets
    tickets.where(sold_originally: false)
  end

  def tickets_sold
    tickets.all.count-tickets.where(sold_originally: false).count + tickets.where(onresell: true).count
  end

end
