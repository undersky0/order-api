FactoryGirl.define do
  factory :v1_product, :class => 'V1::Product' do
    name {Faker::Name.last_name}
    net_price "9.99"
  end

end
