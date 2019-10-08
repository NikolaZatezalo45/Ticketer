class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def user_events
    @userEvents = current_user.events
    @upcomingEvents = @userEvents.upcomingEvents
    @pastEvents = @userEvents.pastEvents
  end
end
