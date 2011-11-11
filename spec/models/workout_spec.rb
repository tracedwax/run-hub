require 'spec_helper'

describe Workout do
  it "should calculate the start of the week to be 11/6/11" do
    workout = Workout.new :when => Time.new(2011, 11, 6)
    workout.tip_of_week.should == Time.new(2011, 11, 6) 
  end
end
