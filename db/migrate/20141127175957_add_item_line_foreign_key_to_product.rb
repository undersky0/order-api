class AddItemLineForeignKeyToProduct < ActiveRecord::Migration
  def change
    remove_column :v1_products, :item_line_id
    add_column :v1_products, :item_line_id, :integer
  end
end
