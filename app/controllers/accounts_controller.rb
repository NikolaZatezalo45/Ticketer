class AccountsController < ApplicationController
  def show
    @account = current_user.account
    @account_transactions = @account.account_transactions
  end
end
