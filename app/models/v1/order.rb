require 'state_machine/core'
class V1::Order < ActiveRecord::Base
extend StateMachine::MacroMethods
# order has many line items
# create edit lines items trhough order order attributes(line_items)
# each line item has a product, quantity
# when product is create it should be assigned to a line item each line item should have quantity and price
# each order can have states
# an order can;t change to canceled without a reason 
# order with items can only be edited while in drafs if order draft and canceled then destroy


  has_one :status_transition
  has_many :item_lines
  belongs_to :user, :class => "V1::Order", :foreign_key => "user_id"
    
    state_machine initial: :draft do
    state :placed, value: 0
    state :paid, value: 1
    state :canceled, value: 2
    
    event :place do 
      transition :draft => :placed
    end
    event :cancel do 
      transition :placed => :draft
    end
    event :pay do 
      transition :placed => :paid
    end
  end

  
# Produce an application to manage products and orders. It should not have a GUI.
# 
# The only interface should be a public REST API. 
# 
# The system should implement the following list of requirements: 
# 
# Products
# 
# • Create/Edit/Delete/Show/List 
# 
# • Each product has a unique name and a price  DONE
# 
# • A product can only be deleted if its not part of any order 
# 
# Orders 
# 
# • Create/Edit/Show/List 
# 
# • Each order has a date (not in the past, defaults to current date), a VAT 
# 
# (default is 20%), a status, and multiple line items 
# 
# • Create/Edit Line Items 
# 
# • Each line item should reference a product, a quantity (> 0) and a price (price 
# 
# of the product when the line item was created) 
# 
# • Each order can have the following statuses: DRAFT (default), PLACED, PAID, 
# 
# CANCELLED 
# 
# • An order can't change to the CANCELLED status without a reason 
# 
# • An order (including line items) can only be edited while in the DRAFT status 
# 
# • An order can only change state according to the following state machine 
# 
# diagram:
end
