
FactoryGirl.define do
  factory :drink, :class => Refinery::Drinks::Drink do
    sequence(:name_en) { |n| "refinery#{n}" }
  end
end

