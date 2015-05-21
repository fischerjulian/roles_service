# Preview all emails at http://localhost:3000/rails/mailers/role_mailer
class RoleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/role_mailer/new
  def new
    RoleMailer.new
  end

end
