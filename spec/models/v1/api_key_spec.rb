require 'rails_helper'
require 'spec_helper'
RSpec.describe V1::ApiKey, :type => :model do
  it {should belong_to(:user)}
  
  context "Created on User.create"
end
