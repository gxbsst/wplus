
FactoryGirl.define do
  factory :table_list, :class => Refinery::TableLists::TableList do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

