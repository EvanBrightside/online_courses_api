FactoryBot.define do
  factory :competency do
    sequence(:name) { |n| "Competency #{n}" }
  end
end