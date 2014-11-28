require 'rails_helper'
require 'spec_helper'
require 'api_helper'
RSpec.describe V1::Order, :type => :model do
  it {should belong_to(:user)}
  it {should have_many(:item_lines)}
  it {should have_one(:status_transition)}
  it {should accept_nested_attributes_for(:item_lines)}
  it {should accept_nested_attributes_for(:status_transition)}
  it {should validate_numericality_of(:vat).with_message('is not a number')}
  
  before(:each) do 
    @user = FactoryGirl.create(:v1_user)
    @order = FactoryGirl.create(:v1_order)
  end
  
  # it 'should return a single order' do
    # response = api_get "order/#{@order.id}", {token: @user.api_key.token}
    # response.status.should == 200
  # end
end
