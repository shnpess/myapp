FactoryBot.define do
  factory :comment do
    id            { "1" }
    text       { "こんばんは" }
    user_id       { "1" }
    post_id      { "1" }

  end
end
