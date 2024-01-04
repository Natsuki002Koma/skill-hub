FactoryBot.define do
  factory :user do
    last_name { Faker::Name.name }
    first_name { Faker::Name.name }
    email { Faker::Internet.email }
    hire_date { Date.new(2000, 4, 1) }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
