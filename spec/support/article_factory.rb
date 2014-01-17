FactoryGirl.define  do
  factory :article do
    title { Faker::Lorem.sentence(10) }
    content { Faker::Lorem.paragraphs(3).join(" ") }
    votes { rand(100) }
    association :user
  end
end
