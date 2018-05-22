FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user, class: User do
    email
    password "testpassword"
    first_name "Peter"
    last_name "Tester"
    admin false
  end
end
