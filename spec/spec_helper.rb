ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require('sinatra/activerecord')
require('GoodSamaritan')
require('ChildTicket')
require 'pry'
require 'shoulda-matchers'

RSpec.configure do |config|
  config.after(:each) do

    ChildTicket.all().each() do |child_ticket|
      child_ticket.destroy()
    end

    GoodSamaritan.all().each() do |good_samaritan|
      good_samaritan.destroy()
    end

  end
end
