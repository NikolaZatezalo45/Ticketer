class MarketplaceController < ApplicationController
  before_action :set_ticket, only: [:sell, :buy, :reclaim]
  def index
    @events = Event.all
  end

  def sell
    @ticket.onresell = true
    @ticket.save
    redirect_to user_path(current_user)
  end

  def buy
    PurchaseOnMarketplaceService.new(@account, current_user, @ticket).CreditSeller
    PurchaseOnMarketplaceService.new(@account, current_user, @ticket).DebitBuyer
    SetTicketService.new(@ticket, current_user).call
    redirect_to user_path(current_user)
  end

  def reclaim
    SetTicketService.new(@ticket, current_user).call
    redirect_to user_path(current_user)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
