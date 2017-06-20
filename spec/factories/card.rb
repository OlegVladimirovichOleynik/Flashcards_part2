FactoryGirl.define do
  factory :card do
    original_text 'Good'
    translated_text 'Хорошо'
    user
    deck
  end

  factory :user do
    email 'oleg@gmail.com'
    password 'password'
  end

  factory :deck do
    name "deck"
    description "this is test deck"
    user
  end

end
