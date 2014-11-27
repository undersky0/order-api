FactoryGirl.define do
  factory :v1_api_key, :class => 'V1::ApiKey' do
    association :v1_user
    #token "MyString"
  end

end
