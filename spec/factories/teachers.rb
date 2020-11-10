FactoryBot.define do
  factory :teacher do
    name {Faker::Name.first_name}
    email {Faker::Internet.email}
    birth_date {Faker::Date.between(from: '1930-01-01', to: Date.today)}
    sex {Faker::Number.between(from: 0, to: 1)}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
