require 'machinist/active_record'
require 'sham'

Sham.name { Faker::Name.first_name }
Sham.surname { Faker::Name.last_name }
Sham.email { Faker::Internet.email }
Sham.password { Faker::Base.bothify('??#??#??##') }

User.blueprint do
  email
  password
  name
  surname_1 { Sham.surname }
end
