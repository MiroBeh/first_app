class Product < ApplicationRecord
  def self.search(search_term)
    if :development
      @Products = Product.where("name LIKE ?", "%#{search_term}%")
    else
      @Products = Product.where("name ilike ?", "%#{search_term}%")
    end
  end
end
