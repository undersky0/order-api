json.array!(@v1_status_transitions) do |v1_status_transition|
  json.extract! v1_status_transition, :id, :event, :from, :to, :order_id
  json.url v1_status_transition_url(v1_status_transition, format: :json)
end
