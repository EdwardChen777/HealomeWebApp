FactoryBot.define do
  factory :subscription do
    plan_id { "MyString" }
    customer_id { "MyString" }
    user { nil }
    status { "MyString" }
    start_date { "2022-08-26 13:06:59" }
    end_date { "2022-08-26 13:06:59" }
  end
end
