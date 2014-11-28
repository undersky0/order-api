class Indexing < ActiveRecord::Migration
  def change
		add_index :v1_products, :item_line_id
		add_index :v1_orders, :user_id
		add_index :v1_item_lines, :order_id
		add_index :v1_status_transitions, :order_id
  end
end
