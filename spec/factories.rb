FactoryBot.define do

  factory :user do
    email { 'johndoe@example.com' }
    first_name { 'John' }
    middle_name { 'Smith' }
    last_name { 'Doe' }
    password { 'password1234' }
    role { 'teacher' }
  end

  factory :group do
   name {"TestGroup"}
   description {"Test description"}
  end

end