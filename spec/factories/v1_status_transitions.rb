FactoryGirl.define do
  factory :v1_status_transition, :class => 'V1::StatusTransition' do
    event "MyString"
from "MyString"
to "MyString"
order_id 1
  end

end
