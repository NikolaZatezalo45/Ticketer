class AccountTransactionService < ApplicationService
  def initialize(total, current_user)
    @total = total
    @current_user = current_user
  end

  def call
    @account = Account.find_by(user_id: @current_user.id)
    @account.amount = @account.amount - @total
    @account.save
  end
end
