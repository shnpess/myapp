FactoryBot.define do

  factory :user do
    name              {"ころ"}
    kind              {"アメリカンショートヘアー"}
    gender            {"オス"}
    vaccination       {"済み"}
    age               {"１歳"}
    character         {"大人しい"}
    image             {"猫1.jpg"}
    user_id           {1}
    content           {"テストテスト"}
  end

end