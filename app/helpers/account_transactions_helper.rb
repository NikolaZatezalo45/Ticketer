module AccountTransactionsHelper
  def note_options
    [
      'initialization',
      'ticket purchase',
      'market selling'
    ]
  end

  def max_tickets
    if @event.tickets[0].price*@event.amount_available_tickets < current_user.account.amount
      (1..@event.amount_available_tickets.to_i).to_a
    else
      (1..(current_user.account.amount/@event.tickets[0].price).to_i).to_a
    end
  end
end
