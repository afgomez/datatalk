require 'machinist/active_record'
require 'sham'

Sham.name { Faker::Name.first_name }
Sham.surname { Faker::Name.last_name }
Sham.email { Faker::Internet.email }
Sham.password { Faker::Base.bothify('??#??#??##') }
Sham.title { Faker::Lorem.sentence(5) }
Sham.body { Faker::Lorem.paragraphs(2) }

User.blueprint do
  username { Sham.name }
  email
  password
  name
  surname_1 { Sham.surname }
  refinery = Role.find_by_title('Refinery')
  # Si aun no hay un usuario con rol refinery, se le da al primero:
  if refinery.nil?
    roles { [Role.create!(:title => 'Refinery')] }
  elsif refinery.users.empty?
    roles { [refinery] }
  end
end

Dataset.blueprint do
  user
  name { Faker::Lorem.sentence(5) }
  origin { Faker::Lorem.sentence(4) }
  data_file do
    file = File.new("tmp/uploaded_files/#{Faker::Base.numerify('####')}.txt", 'w')
    file.write('deleteme')
    file.close
    file
  end
end

Analysis.blueprint do
  title
  body
  user
  visualizations { [Visualization.make] }
end

Visualization.blueprint do
  legend { Sham.title }
  body
  dataset
end
