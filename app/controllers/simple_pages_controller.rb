class SimplePagesController < ApplicationController
  def about
  end

  def contact
  end

  def landing_page

    @bestSeller = Product.limit(4)
    @random = Product.order("RANDOM()").limit(3)
  end
end
