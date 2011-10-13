require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'yaml'
require 'active_support/all'

def next_meeting_date
  s = Date.today.beginning_of_month
  e = Date.today.end_of_month
  (s..e).select{|d| d.wday == 1}[2]
end

configure do
  set :haml, { :format => :html5 }
  set :sass, { :style => :compact }
end

get '/' do
  info          = YAML::load(File.open("meetings.yml"))
  @next_meeting = next_meeting_date
  date          = @next_meeting.strftime('%D')
  @speakers     = info[date]

  haml :index
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

not_found do
  redirect '/'
end
