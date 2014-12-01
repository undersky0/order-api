FactoryGirl.define do
  factory :v1_status_transition, :class => 'V1::StatusTransition' do |t|
    t.event "MyString"
    t.from "MyString"
    t.to "MyString"
    t.association :order, :factory => :v1_order
  end

end
