require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:purchaser) }

  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:price) }

end
