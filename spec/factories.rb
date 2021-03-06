FactoryGirl.define do
  factory :publisher, class: Georelevent::Models::Publisher do
    title { Faker::Lorem.sentence(3) }
    endpoint { Faker::Internet.uri('https') }
  end

  factory :event, class: Georelevent::Models::Event do
    title { Faker::Lorem.sentence(3) }
    description { Faker::Lorem.paragraph(2) }
    feature_id { SecureRandom.hex(10) }
    geom do
      JSON.generate({
        "type"=>"Point",
        "coordinates"=>[Faker::Geolocation.lat,Faker::Geolocation.lng]
      })
    end
  end

  factory :subscription, class: Georelevent::Models::Subscription do
    endpoint { Faker::Internet.uri('https') }
    geom do
      JSON.generate({
        "type"=>"Polygon",
        "coordinates"=>[[[100.0, 0.0],[101.0, 0.0],[101.0, 1.0],[100.0,1.0],[100.0,0.0]]]
      })
    end
  end
end
