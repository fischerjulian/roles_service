class Role < ActiveRecord::Base
  has_many :tasks
  has_and_belongs_to_many :employees

  after_create do |role|
    RoleMailer.new(role).deliver
  end

  def to_s
    title
  end
end
