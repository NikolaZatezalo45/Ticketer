class PurchaseOnMarketplaceService < ApplicationService
  def initialize(account,user, ticket)
    @account = account
    @user = user
    @ticket = ticket
  end

  def CreditSeller
    @account = Account.find_by(user_id: @ticket.purchaser.id)
    @account.amount = @account.amount + @ticket.price
    @account.save
    AccountTransaction.create(amount: @ticket.price, account_id: @account.id, note: "market selling")
    end

    def DebitBuyer
      @account = Account.find_by(user_id: @user.id)
      @account.amount = @account.amount - @ticket.price
      @account.save
      AccountTransaction.create(amount: @ticket.price, account_id: @account.id, note: "market selling")
    end
  end