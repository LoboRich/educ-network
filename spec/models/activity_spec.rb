require 'rails_helper'

RSpec.describe Activity, :type => :model do

  before do
    @group = Group.new(:name => '6th Grade - Happy')
  end

  it "is not valid without an existing group" do
    activity = Activity.new(title: "Test Activity", instructions: "Test Activity")
    expect(activity).to_not be_valid
  end

  it "is not valid without a title" do
    activity = @group.activities.new(title: nil, instructions: "Test Activity")
    expect(activity).to_not be_valid
  end
  
  it "is not valid without an instruction" do
    activity = @group.activities.new(title: "Test Activity", instructions: nil)
    expect(activity).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect(@group.activities.new(title: "Test Activity", instructions: "Activity testing")).to be_valid
  end
  
end