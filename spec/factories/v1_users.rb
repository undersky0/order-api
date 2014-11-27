FactoryGirl.define do
  factory :v1_user, :class => 'V1::User' do
    name {Faker::Name.first_name}
  end

end
