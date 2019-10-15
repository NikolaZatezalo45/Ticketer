class SetTicketService < ApplicationService  
  def initialize(ticket, user)
    @ticket = ticket
    @user = user
  end

  def call
    if @ticket.purchaser == @user
      @ticket.sold_on_marketplace = false
    else
      @ticket.sold_on_marketplace = true
    end
    @ticket.purchaser = @user
    @ticket.onresell = false
    @ticket.save
  end
end