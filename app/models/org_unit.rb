class OrgUnit < ActiveRecord::Base
  belongs_to :parent_unit, class_name: 'OrgUnit'
  validates :title, presence: true

  def to_s
    puts self.parent_unit.inspect
    self.parent_unit.present? ? self.parent_unit.title : "-"
  end
end
