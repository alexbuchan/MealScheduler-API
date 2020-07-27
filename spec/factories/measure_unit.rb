FactoryBot.define do
  factory :measure_unit do
    name { "gram" }
    measure_unit_type { FactoryBot.create(:measure_unit_type) }
  end
end