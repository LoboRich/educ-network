require 'rails_helper'

RSpec.describe Assignment, :type => :model do
  let(:user) { create(:user) }

  it "is valid with the required details" do
    # user = User.create(email: "johndoe@example.com", password: "pass1234", role: "teacher", first_name: "John", middle_name: "Smith", last_name: "Doe")
    # user.confirm
    group = Group.create(user_id: user.id, name: "TestGroup", description:"Hello World")
    assignment = Assignment.create(group_id: group.id, title: "TestAssignment", instructions:"Hello World")
    expect(group).to be_valid
  end

  
end
