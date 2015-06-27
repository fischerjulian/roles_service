class Role < ActiveRecord::Base
  has_many :tasks
  has_and_belongs_to_many :employees
  has_and_belongs_to_many :responsible_for_orgs, join_table: 'org_unit_role_responsibilities', class_name: 'OrgUnit'

  after_create do |role|
    RoleMailer.new(role).deliver
  end

  def to_s
    title
  end
end
