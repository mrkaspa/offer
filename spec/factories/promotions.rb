require "factory_bot"

FactoryBot.define do
  factory :promotion do
    name { "MyText" }
    description { "MyText" }
    promotion_type { "MyText" }
  end
end
