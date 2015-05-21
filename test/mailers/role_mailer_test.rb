require 'test_helper'

class RoleMailerTest < ActionMailer::TestCase
  test "new" do
    mail = RoleMailer.new
    assert_equal "New", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
