# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :joke do
    id 1
    name "MyString"
    time "MyString"
    text "MyString"
    imgurl "MyString"
    forward 1
    comment 1
    videourl "MyString"
  end
end
