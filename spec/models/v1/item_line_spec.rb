require 'rails_helper'

RSpec.describe V1::ItemLine, :type => :model do
  it {should belong_to(:order)}
  it {should have_one(:product)}
end
