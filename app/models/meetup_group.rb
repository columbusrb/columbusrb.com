class MeetupGroup < ActiveRestClient::Base
  base_url Rails.application.config.meetup_api_server_url

  get :info, "meetup-group-wEkWWOXK"

  def self.get_members_count
    self.info.members
  end
end
