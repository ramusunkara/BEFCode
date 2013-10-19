# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    email { "user-#{SecureRandom.hex(8)}@example.com" }
    password "password1234"
  end
end
