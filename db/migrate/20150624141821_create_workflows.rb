class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.string :title
      t.text :description
      t.string :detailed_description_url
      t.references :org_unit
      t.timestamps
    end
  end
end
