class CreateRoleAssignmentJoinTable < ActiveRecord::Migration
  def change
    create_join_table :employees, :roles do |t|
      t.index [:employee_id, :role_id]
      t.index [:role_id, :employee_id]
    end
  end
end
