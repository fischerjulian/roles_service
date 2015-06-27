class OrgUnit < ActiveRecord::Base
  belongs_to :parent_unit, class_name: 'OrgUnit'
  has_many :child_units, class_name: 'OrgUnit', foreign_key: 'parent_unit_id'
  has_many :workflows
  has_and_belongs_to_many :responsible_roles, join_table: 'org_unit_role_responsibilities', class_name: 'Role'


  validates :title, presence: true

  scope :roots, -> { where("parent_unit_id IS NULL") }
end
