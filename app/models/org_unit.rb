class OrgUnit < ActiveRecord::Base
  belongs_to :parent_unit, class_name: 'OrgUnit'
  has_many :child_units, class_name: 'OrgUnit', foreign_key: 'parent_unit_id'
  has_many :workflows

  validates :title, presence: true

  scope :roots, -> { where("parent_unit_id IS NULL") }
end
