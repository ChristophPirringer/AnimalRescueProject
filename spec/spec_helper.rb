ENV['RACK_ENV'] = 'test'
<<<<<<< HEAD

require('rspec')
require('capybara/rspec')
require('sinatra/activerecord')
require('pg')
require('parent_ticket')
require('shot')
# require('organization')
=======
require('rspec')
require('pg')
require('sinatra/activerecord')
require('GoodSamaritan')
require('ChildTicket')
require 'pry'
require 'shoulda-matchers'
>>>>>>> 40687cb6166f3ff9efe26647310b16e83542d6d5

RSpec.configure do |config|
  config.after(:each) do

<<<<<<< HEAD
    Parent_ticket.all().each() do |p|
      p.destroy()
    end

    Shot.all().each() do |s|
      s.destroy()
    end

    # Organization.all().each() do |o|
    #   o.destroy()
    # end
=======
    ChildTicket.all().each() do |child_ticket|
      child_ticket.destroy()
    end

    GoodSamaritan.all().each() do |good_samaritan|
      good_samaritan.destroy()
    end

>>>>>>> 40687cb6166f3ff9efe26647310b16e83542d6d5
  end
end
