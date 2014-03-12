# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :joke_offer do
    user nil
    text "MyString"
    status "MyString"
  end
end
