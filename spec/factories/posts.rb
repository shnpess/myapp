FactoryBot.define do

  factory :post do
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

  factory :user do
    nickname          {"mori"}
    addres            {"福岡県"}
    id                {"1"}
    email             {"aaa@aaa"}
    password          {"aaaaaa"}
  end

end