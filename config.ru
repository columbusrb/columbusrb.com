require 'rubygems'
require 'sinatra'

set :env,  :production
disable :run

require 'server'

run Sinatra::Application