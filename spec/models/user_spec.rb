require 'spec_helper'

Factory.define :user do |factory|
  factory.password "rspec_lots_of_chars"
end

describe User do
  describe "user queries" do
    it "should detect an unregistered user" do
      unregistered_email = "rspec-test-user@testing.net"
      User.email_exists?(unregistered_email).should be_false
    end

    it "should detect a registered user" do
      registered_email = "rspec-registered-user@testing.net"
      user = Factory(:user, :email => registered_email)
      User.email_exists?(registered_email).should be_true
    end
  end
end
