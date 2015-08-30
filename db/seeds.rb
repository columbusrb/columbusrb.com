# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BoardMember.delete_all

BoardMember.create do |b|
  b.name = "Matt Darby"
  b.title = "Director"
  b.bio = "Something amazing"
  b.director = true
end

BoardMember.create do |b|
  b.name = "Tracey Rood"
  b.title = "Treasurer"
  b.bio = "Something amazing"
end

BoardMember.create do |b|
  b.name = "Jon Canady"
  b.title = "Secretary"
  b.bio = "Something amazing"
end

BoardMember.create do |b|
  b.name = "Ben Winkler"
  b.title = "Legal Counsel"
  b.bio = "Something amazing"
end

BoardMember.create do |b|
  b.name = "Mike Danko"
  b.title = "BEARS"
  b.bio = "Something amazing"
end
