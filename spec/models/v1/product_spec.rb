require 'rails_helper'

RSpec.describe V1::Product, :type => :model do
 it {should belong_to(:item_line)}
end
