require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'yaml'
require 'active_support/all'

class MeetingDates
  def initialize
    @crb_dates = []
    @jam_dates = []
    calc_meeting_dates
  end

  def calc_meeting_dates
    start_date = Date.today.beginning_of_year
    (0..12).inject([]){|s, num| dates_for_month(start_date + num.months)}
  end

  def dates_for_month(relative_date)
    s = relative_date.beginning_of_month
    e = relative_date.end_of_month
    crb_date = (s..e).select{|d| d.wday == 1}[2] + 18.5.hours
    @crb_dates << crb_date
    @jam_dates << crb_date + 9.days
  end

  def next_crb_meeting
    @crb_dates.find{|d| d > Time.now}
  end

  def next_jam_meeting
    @jam_dates.find{|d| d > Time.now}
  end
end

helpers do
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
  dates     = MeetingDates.new
  info      = YAML::load(File.open("meetings.yml"))
  @next_crb = dates.next_crb_meeting
  @next_jam = dates.next_jam_meeting
  date      = @next_crb.strftime('%D')
  @speakers = info[date] || []

  haml :index
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

not_found do
  redirect '/'
end
