require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:account_transactions) }


  it { should validate_presence_of(:amount) }
end
