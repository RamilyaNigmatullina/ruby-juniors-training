FactoryGirl.define do
  factory :user do
    email
    full_name { Faker::Name.name }
    password "123456"
    password_confirmation { password }
    role "user"
    confirmed_at 1.hour.ago

    factory :admin, traits: %i[admin]

    trait :not_confirmed do
      confirmed_at nil

      after(:create) do |user|
        user.update(confirmation_sent_at: 3.days.ago)
      end
    end

    trait :admin do
      role "admin"
    end
  end
end
