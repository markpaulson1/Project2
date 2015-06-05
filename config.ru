require 'pg'
require 'pry'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './app'

run NewDadsChat::Server