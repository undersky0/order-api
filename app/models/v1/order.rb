require 'state_machine/core'
class V1::Order < ActiveRecord::Base
extend StateMachine::MacroMethods

  
  has_many :item_lines
  validates_numericality_of :vat, :message => 'is not a number'
  belongs_to :user, :class => "V1::Order", :foreign_key => "user_id"
  has_one :status_transition
  accepts_nested_attributes_for :item_lines, :status_transition
  after_create :create_status
  
  def create_status
    self.create_status_transition if self.status_transition.nil?
  end
  
    state_machine :state, :initial => :draft do
    state :draft, value: 0
    state :placed, value: 1
    state :paid, value: 2
    state :canceled, value: 3
    
    after_transition any => any do |transition|
      self.object.status_transition.update(event: transition.event, 
       from: transition.from, to: ttransition.to)
    end

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
end
