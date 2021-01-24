require 'faker'
require 'gimei'

150.times do |n|
  sample_name = Gimei.kanji
  sample_kana = Gimei.katakana
  sample_email = Faker::Internet.email
  sample_tel = Faker::Number.number(digits: 11)
  start_time = Faker::Date.between(from: '2021-01-01', to: '2021-04-30')
  # start_time = Faker::Date.forward(50)
  Demo.create!(
    sample_name:         sample_name, 
    sample_kana:         sample_kana, 
    sample_email:        sample_email, 
    sample_tel:          sample_tel, 
    sample_product_name: "京都ツアー", 
    price:               "19600", 
    num_id:              "2", 
    start_time:          start_time, 
    sample_id:           "1", 
    created_at:          "2021-01-01 00:00:00",
    updated_at:          "2021-01-01 00:00:00"
  )
end