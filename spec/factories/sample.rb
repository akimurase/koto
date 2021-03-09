FactoryBot.define do
  factory :sample do
    name                  {"test"}
    kana                  {"test"}
    email                 {Faker::Internet.free_email}
    tel                   {"000000000000"}
    product_name          {"test"}
    password              {"000000"}
    password_confirmation {password}
  end
end
