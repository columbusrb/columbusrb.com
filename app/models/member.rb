class Member < ActiveRecord::Base
  attr_protected

  def self.urls
    all.map(&:url).to_json.html_safe
  end

  def url
    "http://www.gravatar.com/avatar/#{md5_hash}?s=40&d=404".html_safe
  end

end
