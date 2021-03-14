FactoryBot.define do
  factory :user do
    name                  {"test"}
    kana                  {"test"}
    email                 {Faker::Internet.free_email}
    tel                   {"000000000000"}
    password              {"000000"}
    password_confirmation {password}
  end
end
