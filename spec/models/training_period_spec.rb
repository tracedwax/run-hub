require 'spec_helper'

describe TrainingPeriod do
  it "should calculate the tip of the week to be 11/6/11" do
    period = TrainingPeriod.new DateTime.new(2011, 11, 6).in_time_zone
    period.tip_of_week.should == DateTime.new(2011, 11, 6) 
  end

  it "should calculate the tip of the week to be 11/6/11" do
    period = TrainingPeriod.new DateTime.new(2011, 11, 8).in_time_zone
    period.tip_of_week.should == DateTime.new(2011, 11, 6)
  end

  it "should calculate the tip of the week to be 10/30/11" do
    period = TrainingPeriod.new DateTime.new(2011, 10, 31).in_time_zone
    period.tip_of_week.should == DateTime.new(2011, 10, 30)
  end

  it "should part 11-6-2011 into a DateTime" do
    date = "11-6-2011"
    TrainingPeriod.parse_date(date).should == DateTime.new(2011, 11, 6)
  end
end
