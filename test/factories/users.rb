FactoryBot.define do
    factory :user do
      first_name { "Nicholas" }
      last_name { "Goatifi" }
      phone { rand(10 ** 10).to_s.rjust(10,'0') }
      email { |u| "#{u.first_name[0]}#{u.last_name}#{(1..99).to_a.sample}@example.com".downcase }
      role { "customer" }
      active { true }
    end
  end
  