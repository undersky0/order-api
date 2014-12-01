FactoryGirl.define do
  factory :v1_item_line, :class => 'V1::ItemLine' do
    quantity 1
    net_price 9
  end
  factory :line_with_order, :class => 'V1::ItemLine' do |t|
    t.quantity {Faker::Number.digit}
    t.net_price {Faker::Commerce.price}
    t.association :order, :factory => :v1_order
  end
  
end
