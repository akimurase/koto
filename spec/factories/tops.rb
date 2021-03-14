FactoryBot.define do
  factory :top do
    title             {"test"}
    association :client

    # after(:build) do |top|
    #   top.video_top.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end
end
