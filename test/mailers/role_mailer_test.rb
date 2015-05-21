require 'test_helper'

class RoleMailerTest < ActionMailer::TestCase

  setup do
    @role = roles(:one)
  end

  test "new" do
    mail = RoleMailer.new(@role)
    assert_match "Rolle", mail.subject
    assert_equal ["hr@example.org"], mail.to
    assert_equal ["roles.service@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
