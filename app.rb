require('pg')
require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/good_samaritan')
also_reload('lib/**/*.rb')
require 'pry'

after do ()
	ActiveRecord::Base.clear_active_connections!
end


##########################
####___Index-Entry___#####
##########################
get("/") do
	erb(:index)
end
