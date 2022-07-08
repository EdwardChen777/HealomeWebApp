FactoryBot.define do
  factory :cognito do
    user_id { 1 }
    expire_time { 1 }
    issued_time { 1 }
    audience { "MyString" }
    refresh_token { "MyText" }
  end
end
