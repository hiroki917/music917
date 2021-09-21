FactoryBot.define do
  factory :music do
    name            {"ベースフレーズ"}
    phrase          {"既存フレーズ"}
    text            {"テストです"}
    genre_id        {2}
    

    after(:build) do |music|
      music.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
