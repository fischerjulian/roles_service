class Employee < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

#  alias name fullname


  has_and_belongs_to_many :roles


  def fullname
    "#{firstname} #{lastname}"
  end

  def name
    fullname
  end
end
