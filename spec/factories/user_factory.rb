FactoryGirl.define do
  factory :user do
    sequence(:email)      { |n| 'u%06d@example.com' % n }
    password              'P@ssw0rd'
    password_confirmation 'P@ssw0rd'
  end
end
