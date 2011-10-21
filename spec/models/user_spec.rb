require 'spec_helper'

Factory.define :user do |factory|
  factory.username "rspec-registered-user"
  factory.email "rspec@testing.net"
  factory.password "rspec_lots_of_chars"
end

describe User do
  describe "user queries" do
    it "should detect an unregistered user" do
      unregistered_username = "rspec-test-user"
      User.username_exists?(unregistered_username).should == false
    end

    it "should detect a registered user" do
      registered_username = "rspec-registered-user"
      user = Factory(:user)
      User.username_exists?(registered_username).should == true
    end
  end
end
