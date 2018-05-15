require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) {Product.create!(name: "Black Shirt")}
    let(:user) {User.create!(first_name: "Mike", last_name: "Tester", email: "test@web.de", password: "testpassword")}

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful")
      product.comments.create!(rating: 3, user: user, body: "Ok")
      product.comments.create!(rating: 5, user: user, body: "Great")
    end

    it "return the average rating of the product" do
      expect(product.average_rating).to eq 3
    end
  end

  context "is not valid without name" do
    it "return that a product with only a description is not valid" do
      expect(Product.new(description: "test description")).not_to be_valid
    end
  end
end
