require 'rubygems'
require 'sinatra'

set :env,  :production
disable :run

require "#{Dir.pwd}/server"

run Sinatra::Application
