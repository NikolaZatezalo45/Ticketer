require 'rails_helper'

RSpec.describe Normal, type: :model do
  it { should have_many(:tickets) }
end
