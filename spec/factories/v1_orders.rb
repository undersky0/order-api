FactoryGirl.define do
  factory :v1_order, :class => 'V1::Order' do
    state "default"
    vat '20'
  end

end
