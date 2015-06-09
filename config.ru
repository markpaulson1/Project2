require 'rubygems'
require 'bundler'
require 'pg'
require 'sinatra/base'

Bundler.require(:default, ENV['RACK_ENV'] || 'development')


require_relative './app'
use Rack::MethodOverride

run NewDadsChat::Server











