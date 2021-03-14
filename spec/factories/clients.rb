FactoryBot.define do
  factory :client do
    company_name          {"test"}
    c_kana                {"test"}
    supervisor            {"test"}
    s_kana                {"test"}
    company_address       {"test"}
    tel                   {"000000000000"}
    email                 {Faker::Internet.free_email}
    password              {"000000"}
    password_confirmation {password}
  end
end
