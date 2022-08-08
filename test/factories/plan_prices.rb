FactoryBot.define do
  factory :plan_price do
    plan { nil }
    price { 1.5 }
    start_date { "2022-08-07" }
    end_date { "2022-08-07" }
  end
end
