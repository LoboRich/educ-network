require 'rails_helper'

RSpec.describe Group, :type => :model do
  let(:teacher) { create(:user) }

  it "is valid with the required details" do
    group = Group.new(user_id: teacher.id, name: "TestGroup", description:"Hello World")
    expect(group).to be_valid
  end

  it "is not valid without user id" do
    group = Group.new(name: "Test", description: "Hello World")
    expect(group).to_not be_valid
  end

  it "is not valid without a name" do
    group = Group.new(user_id: teacher.id, name: nil, description: "Hello World")
    expect(group).to_not be_valid
  end

  it "is not valid without a description"do
    group = Group.new(user_id: teacher.id, name: "Class Masipag")
    expect(group).to_not be_valid
  end

  it "has no duplicate student record" do
    student = User.create(email: "student@er.com", password: "password", role: "student")
    group = Group.new(user_id: teacher.id, name: "TestSample", description:"Hello World")
    class_student1 = ClassStudent.new(user_id: student.id, group_id: group.id)
    class_student2 = ClassStudent.new(user_id: student.id, group_id: group.id)
    expect(class_student2).to_not be_valid
  end
  
end
