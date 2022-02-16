require 'rails_helper'

RSpec.describe Post, type: :model do 

  context "When user creates post " do
    it "is not valid without content" do
      post = Post.new(content: nil)
      expect(Post.new).to_not be_valid
    end
  end
end
