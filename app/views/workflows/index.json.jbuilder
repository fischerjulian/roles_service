json.array!(@workflows) do |workflow|
  json.extract! workflow, :id, :title, :description, :detailed_description_url
  json.url workflow_url(workflow, format: :json)
end
