class SetupAccountService < ApplicationService
  def initialize(current_user)
    @current_user = current_user
  end

  def call
    @account = Account.create(user_id: @current_user.id, amount: 100)
    AccountTransaction.create(amount: 100, account_id: @account.id, note: "initialization")
  end
end
