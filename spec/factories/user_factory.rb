FactoryBot.define do
  sequence(:email) {|n| "user#{n}@example.com"}

  factory :user, class: User do
    email
    password "testpassword"
    first_name "Peter"
    last_name "Tester"
    admin false
  end

  factory :admin, class: User do
    email "admin@example.de"
    password "testpassword"
    first_name "real"
    last_name "admin"
    admin true
  end
end
