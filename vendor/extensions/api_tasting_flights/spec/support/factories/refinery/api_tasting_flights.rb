
FactoryGirl.define do
  factory :api_tasting_flight, :class => Refinery::ApiTastingFlights::ApiTastingFlight do
    sequence(:sku) { |n| "refinery#{n}" }
  end
end

