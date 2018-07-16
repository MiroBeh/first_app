FactoryBot.define do
  factory :product, class: Product do
    name "test product"
    description "test description"
    image_url "test.jpg"
    colour "blue"
    price "12.5"
    gender "men"
  end
end
