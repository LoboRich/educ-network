require 'rails_helper'

RSpec.describe Group, :type => :model do
  let(:user) { create(:user) }

  it "is valid with the required details" do
    # user = User.create(email: "johndoe@example.com", password: "pass1234", role: "teacher", first_name: "John", middle_name: "Smith", last_name: "Doe")
    # user.confirm
    group = Group.new(user_id: user.id, name: "TestGroup", description:"Hello World")
    expect(group).to be_valid
  end

  it "is not valid without a name" do
    group = Group.new(name: nil, description: "Hello World")
    expect(group).to_not be_valid
  end

  it "is not valid without a description"do
    group = Group.new(name: "Class Masipag")
    expect(group).to_not be_valid
  end
  
end
