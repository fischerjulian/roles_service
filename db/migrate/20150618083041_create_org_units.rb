class CreateOrgUnits < ActiveRecord::Migration
  def change
    create_table :org_units do |t|
      t.string :title
      t.text :description
      t.references :parent_unit, index: true

      t.timestamps
    end
  end
end
