class V1::User < ActiveRecord::Base
  has_one :api_key, dependent: :destroy
  has_many :orders, :foreign_key => "user_id"
  after_create :create_api_key
  
  private
    def create_api_key
      V1::ApiKey.create :user => self
      
    end
end
