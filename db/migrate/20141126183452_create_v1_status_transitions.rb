class CreateV1StatusTransitions < ActiveRecord::Migration
  def change
    create_table :v1_status_transitions do |t|
      t.string :event
      t.string :from
      t.string :to
      t.integer :order_id

      t.timestamps
    end
  end
end
