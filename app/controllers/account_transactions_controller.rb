class AccountTransactionsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def show
  end
  def new 
  end 
  def create
    @total = params[:number_of_tickets].to_i * @event.tickets[0].price
    @account_transaction = AccountTransaction.new(account_id: current_user.account.id, note: "ticket purchase", amount: @total)
    if @account_transaction.save
      AccountTransactionService.new(@total, current_user).call
      TicketPurchaseService.new(@event, current_user,params[:number_of_tickets].to_i).call
      redirect_to account_path(current_user)
    end
  end
  private

  def set_event
    @event = Event.find(params[:event_id])
  end

end
