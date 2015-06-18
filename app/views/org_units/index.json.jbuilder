json.array!(@org_units) do |org_unit|
  json.extract! org_unit, :id, :title, :description, :parent_unit_id
  json.url org_unit_url(org_unit, format: :json)
end
