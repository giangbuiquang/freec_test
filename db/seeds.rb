# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


unless User.find_by_email "giang.buiquang@gmail.com"
  User.create! :name => 'Giang', :email => 'giang.buiquang@gmail.com', :password => '123123A@', :password_confirmation => '123123A@', role: "admin"
end

(1..20).each do |i|
  User.create! :name => 'Giang', :email => "giang.buiquang_#{i}@gmail.com", :password => '123123A@', :password_confirmation => '123123A@'
end
