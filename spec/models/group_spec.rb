require 'rails_helper'

RSpec.describe Group, :type => :model do

  it "is not valid without a name" do
    group = Group.new(name: nil, description: "Hello World")
    expect(group).to_not be_valid
  end

  it "is not valid without a description"do
    group = Group.new(name: "Class Masipag")
    expect(group).to_not be_valid
  end
  
end
  