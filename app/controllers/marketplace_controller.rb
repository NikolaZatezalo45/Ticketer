class MarketplaceController < ApplicationController
  def index
    @events = Event.all
  end
  def sell
    @ticket = Ticket.find(params[:id])
    @ticket.onresell = true
    @ticket.save
    redirect_to marketplace_index_path
  end
  def buy
    @ticket = Ticket.find(params[:id])
    @account = Account.find_by(user_id: @ticket.purchaser.id)
    @account.amount = @account.amount + @ticket.price
    @account.save
    AccountTransaction.create(amount: @ticket.price, account_id: @account.id, note: "market selling")
    @account = Account.find_by(user_id: current_user.id)
    @account.amount = @account.amount - @ticket.price
    @account.save
    AccountTransaction.create(amount: @ticket.price, account_id: @account.id, note: "market selling")
    @ticket.purchaser = current_user
    @ticket.onresell = false
    @ticket.sold_on_marketplace = true
    @ticket.save
    redirect_to marketplace_index_path
  end
end
