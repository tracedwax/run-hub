require 'spec_helper'

Factory.define :user do |factory|
  factory.password "rspec_lots_of_chars"
  factory.email "rspec@testing.net"
end

describe User do
  describe "user queries" do
    it "should detect an unregistered user" do
      unregistered_username = "rspec-test-user"
      User.username_exists?(unregistered_username).should be_false
    end

    it "should detect a registered user" do
      registered_username = "rspec-registered-user"
      user = Factory(:user, :username => registered_username)
      User.username_exists?(registered_username).should be_true
    end
  end
end
