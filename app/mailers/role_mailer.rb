class RoleMailer < ActionMailer::Base
  default from: "roles.service@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.role_mailer.new.subject
  #
  def new(role)
    @role = role

    mail to: "hr@example.org"
  end
end
