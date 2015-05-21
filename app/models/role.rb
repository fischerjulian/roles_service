class Role < ActiveRecord::Base
  has_many :tasks

  after_create do |role|
    RoleMailer.new(role).deliver
  end

  def to_s
    title
  end
end
