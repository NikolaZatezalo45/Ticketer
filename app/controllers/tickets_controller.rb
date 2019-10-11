class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @event = Event.find(params[:format])
  end
end
