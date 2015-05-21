class Task < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :role
  has_and_belongs_to_many :categories
end
