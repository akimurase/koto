FactoryBot.define do
  factory :product do
    name           {"test"}
    price          {"test"}
    unit           {"test"}
    association :client

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
