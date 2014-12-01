require 'rails_helper'

RSpec.describe V1::StatusTransition, :type => :model do
  it {should belong_to(:order)}
end
