class Account < ApplicationRecord
  belongs_to :user
  has_many :account_transactions
  validates :amount, :greater_than 0
end
