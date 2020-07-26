FactoryBot.define do
  factory :recipe do
    name { "Ham Sandwich" }
    steps { "step1-Stepping 1-step2-Stepping 2" }
    comments { "A comment" }
    preparation_time { 5 }
    cooking_time { 0 }
    difficulty { "easy" }
    measure_system { "metric" }

    user { FactoryBot.create(:user) }
  end
end