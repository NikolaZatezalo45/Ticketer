class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcomingEvents = @events.upcomingEvents
    @pastEvents = @events.pastEvents
  end

  def new
    @event = Event.new
  end
  def show 

  end

  def create
    @event = Event.new(event_params.merge(creator: current_user))
    if (@event.save)
      TicketCreator.new(params[:event]).call
      redirect_to events_path
    end
  end

  private
    def event_params
      params.require(:event).permit(
        :name,
        :number_of_tickets,
        :date,
        :category_id,
        :description
      )
    end
end
