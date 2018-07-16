FactoryBot.define do
  factory :comment, class: Comment do
    body "Comment"
    rating "1"
    user
    product
  end

  factory :invalid_comment, class: Comment do
    body "Comment"
    rating "not a number"
    user
    product
  end
end
