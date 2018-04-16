class Product < ApplicationRecord
  def self.search(search_term)
    if :development
      @products = Product.where("name LIKE ?", "%#{search_term}%")
    else
      @products = Product.where("name ILIKE ?", "#{search_term}%")
    end
  end
end
