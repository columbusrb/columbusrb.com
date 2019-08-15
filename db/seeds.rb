Meeting.delete_all
Speaker.delete_all
BoardMember.delete_all
Video.delete_all

Meeting.find_or_create_next_date

20.times do
  Video.create do |v|
    v.name = Faker::Name.name
    v.title = Faker::Company.catch_phrase
  end
end

BoardMember.create do |b|
  b.name = "Matt Darby"
  b.title = "Director"
  b.bio = Faker::Lorem.paragraphs.join(" ")
  b.director = true
end

BoardMember.create do |b|
  b.name = "Tracy Rood"
  b.title = "Treasurer"
  b.bio = Faker::Lorem.paragraph
end

BoardMember.create do |b|
  b.name = "Jon Canady"
  b.title = "Secretary"
  b.bio = Faker::Lorem.paragraph
end

BoardMember.create do |b|
  b.name = "Ben Winkler"
  b.title = "Legal Counsel"
  b.bio = Faker::Lorem.paragraph
end

BoardMember.create do |b|
  b.name = "Mike Danko"
  b.title = "BEARS"
  b.bio = Faker::Lorem.paragraph
end

Meeting.all.each do |m|
  3.times do |x|
    m.speakers.create do |s|
      s.name = Faker::Name.name
      s.title = Faker::Company.catch_phrase
      s.url = Faker::Internet.url(host:'columbusrb.com')
      s.twitter = Faker::Internet::user_name
    end
  end
end
