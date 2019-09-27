FactoryBot.define do

  factory :user do
    nick_name             {"ナルト"}
    family_name           {"うずまき"}
    family_kana           {"うずまき"}
    first_name            {"ナルト"}
    first_kana            {"なると"}
    birth_year            {"2000"}
    birth_month           {"1"}
    birth_day             {"1"}
    phone_number          {"01234567890"}
    zip                   {"1234567"}
    prefecture_id         {"27"}
    city                  {"大阪市"}
    block                 {"浪速区〇〇町"}
    building              {"1-2-3"}
    profile               {"まっすぐ自分の言葉は曲げねェ...それが俺の忍道だってばよ"}
    email                 {"hokage@gmail.com"}
    password              {"123456a"}
    password_confirmation {"123456a"}
  end

end
