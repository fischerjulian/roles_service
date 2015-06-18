class OrgUnit < ActiveRecord::Base
  belongs_to :parent_unit, class_name: 'OrgUnit'
  validates :title, presence: true
end
