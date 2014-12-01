FactoryGirl.define do
  factory :v1_order, :class => 'V1::Order' do
    state 0
    vat 20
    user_id 1
  end
end
