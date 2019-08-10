class Member < ActiveRestClient::Base
  base_url Rails.application.config.meetup_api_server_url

  get :members, "meetup-group-wEkWWOXK?&sign=true&photo-host=public&only=members"
end
