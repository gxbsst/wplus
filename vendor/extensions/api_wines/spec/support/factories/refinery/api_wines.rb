
FactoryGirl.define do
  factory :api_wine, :class => Refinery::ApiWines::ApiWine do
    sequence(:type) { |n| "refinery#{n}" }
  end
end

