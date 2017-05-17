FactoryGirl.define do
  factory :card do
    original_text 'Good'
    translated_text 'Хорошо'
    user
  end

  factory :user do
    email 'oleg@mail.ru'
    password '123'
  end
  
end
