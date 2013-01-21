
FactoryGirl.define do
  factory :food, :class => Refinery::Foods::Food do
    sequence(:name_en) { |n| "refinery#{n}" }
  end
end

