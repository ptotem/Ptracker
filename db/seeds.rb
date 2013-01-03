# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:name=>"Administrator",:email => 'admin@ptotem.com', :password => 'crimsonking', :password_confirmation => 'crimsonking', :role=>"Admin")
User.create!(:name=>"Arijit Lahiri",:email => 'arijit@ptotem.com', :password => '19loki76', :password_confirmation => '19loki76', :role=>"Projects")
User.create!(:name=>"Surbhi Sawant",:email => 'surbhi@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"Sales")
User.create!(:name=>"Amol Bhor",:email => 'amol@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"Sales")
User.create!(:name=>"Arunkumar Balasubramanian",:email => 'arun@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"Projects")
User.create!(:name=>"Ashwin Kumar",:email => 'ashwin@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"Projects")
User.create!(:name=>"Perseus Vazifdar",:email => 'perseus@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"DevTeam")
User.create!(:name=>"Sunny Singh",:email => 'sunny@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"DevTeam")
User.create!(:name=>"Nikunj Thakkar",:email => 'nikunj@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"DevTeam")
User.create!(:name=>"Nilesh Panchal",:email => 'nilesh@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"DevTeam")
User.create!(:name=>"Sachin Thakkar",:email => 'sachin@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"DevTeam")
User.create!(:name=>"Rakesh Rengaraj",:email => 'rakesh@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"DevTeam")
User.create!(:name=>"Indrajeet Mishra",:email => 'indrajeet@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :role=>"DevTeam")

Competence.create!([{name: "Design"},{name: "Logic"},{name: "Content"},{name: "Data Design"},{name: "UI"},{name: "Backend"}])

