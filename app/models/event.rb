class Event < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', :foreign_key => 'creator_id'
  has_many :tickets, dependent: :destroy
  validates :name, :number_of_tickets, :date, :category_id, :description, presence: true

  scope :upcomingEvents, -> { where("date>=?", (Date.today)) }
  scope :pastEvents, -> { where("date<?", (Date.today)) }

  def available_tickets
    tickets.where(sold_originally: false).count + tickets.where(onresell: true).count
  end
  def tickets_sold
    tickets.all.count-tickets.where(sold_originally: false).count + tickets.where(onresell: true).count
  end

end
