# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    starts_at "2013-10-19 14:28:41"
    title "MyString"
    venue_name "MyString"
    venue_street_address "MyString"
    venue_city "MyString"
    venue_state "MyString"
    venue_zip "MyString"
  end
end
