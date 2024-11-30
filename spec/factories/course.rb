FactoryBot.define do
  factory :course do
    sequence(:title) { |n| "Course #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    association :author
  end
end
