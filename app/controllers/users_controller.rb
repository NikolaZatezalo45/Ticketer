class UsersController < ApplicationController
  def show
    @user = current_user
    @events = Event.all
  end

  def user_events
    @userEvents = current_user.events
    @upcomingEvents = @userEvents.upcomingEvents
    @pastEvents = @userEvents.pastEvents
    @upcomingEventsOrdered = @userEvents.upcomingEventsOrdered
  end
end
