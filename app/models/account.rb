class Account < ApplicationRecord
  belongs_to :user
  has_many :account_transactions
  validates :amount, :numericality => {:greater_than_or_equal_to => 0}, presence: true
end
