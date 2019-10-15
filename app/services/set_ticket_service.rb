class SetTicketService < ApplicationService  
  def initialize(ticket, user)
    @ticket = ticket
    @user = user
  end

  def call
    @ticket.purchaser = @user
    @ticket.onresell = false
    @ticket.sold_on_marketplace = true
    @ticket.save
  end
end