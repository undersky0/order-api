class V1::ItemLine < ActiveRecord::Base
  belongs_to :order
  has_one :product
  accepts_nested_attributes_for :product
end
