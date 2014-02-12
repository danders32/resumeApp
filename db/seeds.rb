# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Resume.count == 0
  Resume.create(name: 'Kevin Journey', phone:'555-555-5555')
  Resume.create(name: 'Gabriel Allon', phone:'555-555-5556', city:'Las Vegas')
end

