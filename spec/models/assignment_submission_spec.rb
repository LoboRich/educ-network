require 'rails_helper'

RSpec.describe AssignmentSubmission, :type => :model do
  let(:user) { create(:user) }

  it "is valid with the required details" do
    group = Group.create(user_id: user.id, name: "TestGroup", description:"Hello World")
    class_student = ClassStudent.create(user_id: user.id, group_id: group.id, status: "Joined" )
    assignment = Assignment.create(group_id: group.id, title: "TestAssignment", instructions:"Hello World")
    assignment_submission = AssignmentSubmission.new(assignment_id: assignment.id, user_id: user.id, body: "Test Assignment Body")
    expect(assignment_submission).to be_valid
  end

  it "is valid with the required details" do
    group = Group.create(user_id: user.id, name: "TestGroup", description:"Hello World")
    class_student = ClassStudent.create(user_id: user.id, group_id: group.id, status: "Joined" )
    assignment = Assignment.create(group_id: group.id, title: "TestAssignment", instructions:"Hello World")
    assignment_submission = AssignmentSubmission.new(assignment_id: assignment.id, user_id: nil, body: "Test Assignment Body")
    expect(assignment_submission).to_not be_valid
  end

end
