class CreateV1ItemLines < ActiveRecord::Migration
  def change
    create_table :v1_item_lines do |t|
      t.integer :quantity
      t.decimal :net_price
      t.integer :order_id

      t.timestamps
    end
  end
end
