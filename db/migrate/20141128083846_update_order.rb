class UpdateOrder < ActiveRecord::Migration
  def change
    remove_column :v1_orders, :vat
    add_column :v1_orders, :vat, :decimal, precision: 8, scale: 2, default: 20.0
  end
end
