class Product < ApplicationRecord
  has_many :comments

  validates :name, presence: true

  def self.search(search_term)
    if Rails.env == "development"
      @products = Product.where("name LIKE ?", "%#{search_term}%")
    else
      @products = Product.where("name ILIKE ?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_desc_reverse.first
  end

  def average_rating
    comments.average(:rating).to_f
  end
end
