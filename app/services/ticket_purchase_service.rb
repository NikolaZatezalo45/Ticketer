class TicketPurchaseService < ApplicationService
  def initialize(event, current_user,number_of_tickets)
    @event = event
    @current_user = current_user
    @number_of_tickets = number_of_tickets
  end

  def call
    @event.available_tickets.each_with_index  do |n,i|
      break if i == @number_of_tickets
      n.sold_originally = true
      n.purchaser_id = @current_user.id
      n.save
    end
  end
end
