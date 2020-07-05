FactoryBot.define do
  factory :message do
    id            { "1" }
    content       { "こんばんは" }
    user_id       { "1" }
    group_id      { "1" }
  end
end
