require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:events) }

  it { should validate_presence_of(:name) }
end
