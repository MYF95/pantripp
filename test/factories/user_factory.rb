FactoryBot.define do
  factory :user do |u|
    u.sequence(:name) { |n| "Ponsan#{n}"}
    u.sequence(:email) { |n| "ponsan#{n}@bork.com"}
    u.password 'chicken'
    u.password_confirmation 'chicken'
    u.age 15
  end
end