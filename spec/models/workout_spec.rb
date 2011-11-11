require 'spec_helper'

describe Workout do
  it "should calculate the start of the week to be 11/6/11" do
    workout = Workout.new :when => DateTime.new(2011, 11, 6)
    workout.tip_of_week.should == DateTime.new(2011, 11, 6) 
  end

  it "should calculate the start of the week to be 11/6/11" do
    workout = Workout.new :when => DateTime.new(2011, 11, 8)
    workout.tip_of_week.should == DateTime.new(2011, 11, 6)
  end

  it "should calculate the start of the week to be 10/30/11" do
    workout = Workout.new :when => DateTime.new(2011, 10, 31)
    workout.tip_of_week.should == DateTime.new(2011, 10, 30)
  end
end
