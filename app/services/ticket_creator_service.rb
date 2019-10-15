class TicketCreatorService < ApplicationService
    attr_reader :event
    
    def initialize(event)
      @event = event
    end
  
    def call
        (1..@event[:number_of_tickets].chomp.to_i).each do
        @ticket = Ticket.create("number": SecureRandom.uuid[0..10], "event_id": Event.find_by(name: @event[:name]).id, "price": @event["price"])
        end
    end
end