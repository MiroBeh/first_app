require 'rails_helper'

describe Comment do
  context "is not valid without body or user or rating" do
    let(:product) {Product.create!(name: "Black Shirt")}
    let(:user) { FactoryBot.create(:user)}

    it "return that a comment without a body is not valid" do
      expect(product.comments.new(rating: 1, user: user)).not_to be_valid
    end

    it "return that a comment without a user is not valid" do
      expect(product.comments.new(rating: 1, body: "test")).not_to be_valid
    end

    it "return that a comment without a rating is not valid" do
      expect(product.comments.new(user: user, body: "test")).not_to be_valid
    end
  end
end
