FactoryBot.define do
  factory :skill do
    skill_name { Faker::Lorem.word }
    skill_status_id { Faker::Number.between(from: 2, to: 7) }
    skill_level { 0 }
  end
end
