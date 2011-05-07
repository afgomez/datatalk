require 'machinist/active_record'
require 'sham'

Sham.name { Faker::Name.first_name }
Sham.surname { Faker::Name.last_name }
Sham.email { Faker::Internet.email }
Sham.password { Faker::Base.bothify('??#??#??##') }
Sham.file do
  file = File.new("tmp/uploaded_files/#{Faker::Base.numerify('####')}.txt", 'w')
  file.write('deleteme')
  file.close
  file
end

User.blueprint do
  username { Sham.name }
  email
  password
  name
  surname_1 { Sham.surname }
end

Dataset.blueprint do
  name { Faker::Lorem.sentence(5) }
  origin { Faker::Lorem.sentence(4) }
  data_file { Sham.file }
end
