require 'spec_helper'

describe User do
  describe "user queries" do
    it "should detect an unregistered user" do
      unregistered_username = "rspec-test-user"
      User.username_exists?(unregistered_username).should == false
    end
  end
end
