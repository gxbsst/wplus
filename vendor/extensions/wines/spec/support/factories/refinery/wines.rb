
FactoryGirl.define do
  factory :wine, :class => Refinery::Wines::Wine do
    sequence(:vintage) { |n| "refinery#{n}" }
  end
end

