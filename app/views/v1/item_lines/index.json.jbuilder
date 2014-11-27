json.array!(@v1_item_lines) do |v1_item_line|
  json.extract! v1_item_line, :id, :quantity, :net_price, :product_id, :order_id
  json.url v1_item_line_url(v1_item_line, format: :json)
end
