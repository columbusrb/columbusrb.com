class MeetupGroup < Flexirest::Base
  base_url 'https://api.meetup.com/'

  get :info, "meetup-group-wEkWWOXK"

  def self.get_members_count
    self.info.members
  end
end
