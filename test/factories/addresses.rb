FactoryBot.define do
  factory :address do
    customer { nil }
    recipient { "MyString" }
    street_1 { "MyString" }
    street_2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    active { false }
    is_billing { false }
  end
end
