ENV['RACK_ENV'] = 'test'


require('rspec')
require('capybara/rspec')
require('sinatra/activerecord')
require('pg')
require('shoulda-matchers')
require('GoodSamaritan')
require('ChildTicket')
require('organization')
require('parent_ticket')
require('shot')
require('pry')



RSpec.configure do |config|
  config.after(:each) do

    ParentTicket.all().each() do |p|
      p.destroy()
    end

    Shot.all().each() do |s|
      s.destroy()
    end

    Organization.all().each() do |o|
      o.destroy()
    end

    ChildTicket.all().each() do |child_ticket|
      child_ticket.destroy()
    end

    GoodSamaritan.all().each() do |good_samaritan|
      good_samaritan.destroy()
    end


  end
end
