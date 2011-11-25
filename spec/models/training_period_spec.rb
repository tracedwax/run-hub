require 'spec_helper'

Factory.define :workout do |factory|
  factory.user_id 1
  factory.category "Easy"
end

describe TrainingPeriod do
  it "should calculate the tip of the week to be 11/6/11" do
    period = TrainingPeriod.new 1, DateTime.new(2011, 11, 6).in_time_zone
    period.tip_of_week.should == DateTime.new(2011, 11, 6) 
  end

  it "should calculate the tip of the week to be 11/6/11" do
    period = TrainingPeriod.new 1, DateTime.new(2011, 11, 8).in_time_zone
    period.tip_of_week.should == DateTime.new(2011, 11, 6)
  end

  it "should calculate the tip of the week to be 10/30/11" do
    period = TrainingPeriod.new 1, DateTime.new(2011, 10, 31).in_time_zone
    period.tip_of_week.should == DateTime.new(2011, 10, 30)
  end

  it "should parse 11-6-2011 into a DateTime" do
    date = "11-6-2011"
    TrainingPeriod.parse_date(date).should == DateTime.new(2011, 11, 6)
  end

  it "should parse 1-2-1998 into a DateTime" do
    date = "1-2-1998"
    TrainingPeriod.parse_date(date).should == DateTime.new(1998, 1, 2)
  end

  it "should find one workout for Sunday" do
    Factory(:workout, :when => DateTime.new(2011, 11, 6).in_time_zone)
    
    period = TrainingPeriod.new 1, DateTime.new(2011, 11, 6).in_time_zone
    period.first[:workouts].size.should == 1
  end

  it "should find two workouts for Sunday" do
    Factory(:workout, :when => DateTime.new(2011, 11, 6).in_time_zone)
    Factory(:workout, :when => DateTime.new(2011, 11, 6).in_time_zone)
    
    period = TrainingPeriod.new 1, DateTime.new(2011, 11, 6).in_time_zone
    period.first[:workouts].size.should == 2
  end

  it "should find one workout for Sunday when there are two workouts by different users" do
    Factory(:workout, :when => DateTime.new(2011, 11, 6).in_time_zone)
    Factory(:workout, :when => DateTime.new(2011, 11, 6).in_time_zone, :user_id => 2)

    period = TrainingPeriod.new 1, DateTime.new(2011, 11, 6).in_time_zone
    period.first[:workouts].size.should == 1
  end

  it "should retrieve my workout for 11/7/11" do
    Factory(:workout, :when => DateTime.new(2011, 11, 7).in_time_zone)

    period = TrainingPeriod.new 1, DateTime.new(2011, 11, 6).in_time_zone
    period.to_a[1][:workouts].size.should == 1
  end

  it "should calculate an empty period to have 0 total miles" do
    period = TrainingPeriod.new 1, DateTime.new(2011, 11, 6).in_time_zone
    period.total_miles.should == 0
  end

  it "should calculate a period with 2 workouts of 5 miles to have 10 total miles" do
    period = TrainingPeriod.new 1, DateTime.new(2011, 11, 6).in_time_zone
    
    first_workout = Factory(:workout, :when => DateTime.new(2011, 11, 7).in_time_zone, :distance => 5)
    second_workout = Factory(:workout, :when => DateTime.new(2011, 11, 7).in_time_zone, :distance => 5)

    period.total_miles.should == 10
  end
end
