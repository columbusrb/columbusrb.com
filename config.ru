require 'rubygems'
require 'bundler'
require 'sinatra'

Bundler.require

set :env,  :production
disable :run

require "#{Dir.pwd}/server"

run Sinatra::Application
