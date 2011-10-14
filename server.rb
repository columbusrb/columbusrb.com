require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'yaml'
require 'active_support/all'

helpers do
  def next_crb_meeting_date
    @next_crb_meeting_date ||= begin
      s = Date.today.beginning_of_month
      e = Date.today.end_of_month
      date = (s..e).select{|d| d.wday == 1}[2]
      date + 18.5.hours
    end
  end

  def next_code_jam_date
    @next_code_jam_date ||= begin
      next_crb_meeting_date + 9.days
    end
  end

  def formatted_date(date)
    day = date.day.ordinalize
    date.strftime("%A, %B #{day}, %Y at %l:%M%P")
  end
end

configure do
  set :haml, { :format => :html5 }
  set :sass, { :style => :compact }
end

get '/' do
  info      = YAML::load(File.open("meetings.yml"))
  @next_crb = next_crb_meeting_date
  @next_jam = next_code_jam_date
  date      = @next_crb.strftime('%D')
  @speakers = info[date]

  haml :index
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

not_found do
  redirect '/'
end
