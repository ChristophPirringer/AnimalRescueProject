ENV['RACK_ENV'] = 'test'

require('rspec')
require('capybara/rspec')
require('sinatra/activerecord')
require('pg')
require('parent_ticket')
require('shot')
# require('organization')

RSpec.configure do |config|
  config.after(:each) do

    Parent_ticket.all().each() do |p|
      p.destroy()
    end

    Shot.all().each() do |s|
      s.destroy()
    end

    # Organization.all().each() do |o|
    #   o.destroy()
    # end
  end
end
