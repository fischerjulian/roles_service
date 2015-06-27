class CreateOrgUnitRoleJoinTable < ActiveRecord::Migration
  def change
    create_join_table :org_units, :roles, table_name: 'org_unit_role_responsibilities' do |t|
      # t.index [:role_id, :org_unit_id]
      t.index [:org_unit_id, :role_id], unique: true, name: 'orgu_role_resp_xaf'
    end
  end
end
