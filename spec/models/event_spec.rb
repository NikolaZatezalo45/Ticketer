require 'rails_helper'

RSpec.describe Event, type: :model do

  it { should belong_to(:category) }
  it { should belong_to(:creator) }
  it { should have_many(:tickets) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:number_of_tickets) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:description) }
end
