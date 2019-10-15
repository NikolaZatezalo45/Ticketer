class MarketplaceController < ApplicationController
  before_action :set_ticket, only: [:sell, :buy]
  def index
    @events = Event.all
  end
  def sell
    @ticket.onresell = true
    @ticket.save
    redirect_to marketplace_index_path
  end
  def buy
    PurchaseOnMarketplaceService.new(@account, current_user, @ticket).CreditSeller
    PurchaseOnMarketplaceService.new(@account, current_user, @ticket).DebitBuyer
    SetTicketService.new(@ticket, current_user).call
    redirect_to marketplace_index_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
