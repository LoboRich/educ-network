require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { create(:user) }

  it "is valid with the required details" do
    user = User.new(email: "test@x.com", password: "password", role: "teacher")
    expect(user).to be_valid
  end

  it "is not valid without a role" do
    user = User.new(email: "test@x.com", password: "password")
    expect(user).to_not be_valid
  end
  
end
