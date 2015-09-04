require('pg')
require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/GoodSamaritan')
require('./lib/ChildTicket')
require('./lib/organization')
require('./lib/parent_ticket')
also_reload('lib/**/*.rb')
require 'pry'

after do ()
	ActiveRecord::Base.clear_active_connections!
end


####################################
#########___Index-Entry___##########
####################################
get("/") do
	erb(:index)
end


####################################
########___Samaritans-Form___#######
####################################
get("/samaritans/new") do
	erb(:samaritans_form)
end

post("/samaritans") do
	name = params.fetch("name")
	email = params.fetch("email")
	phone_number = params.fetch("phone_number")
	samaritan = GoodSamaritan.new({:name => name, :email => email, :phone_number => phone_number})
	samaritan.save()
  @samaritans = GoodSamaritan.all()
	erb(:samaritans)
end


####################################
#########___Samaritans-Page___######
####################################
get("/samaritans") do
	@samaritans = GoodSamaritan.all()
	erb(:samaritans)
end


####################################
#########___Samaritan-Page___#######
####################################
get("/samaritans/:id") do
	@samaritan = GoodSamaritan.find(params.fetch("id").to_i())
	erb(:samaritan)
end


####################################
########___ChildTicket-Form___######
####################################
get("/samaritans/:id/ticket_new") do
	@samaritan = GoodSamaritan.find(params.fetch("id").to_i())
	erb(:samaritans_ticket_new)
end

post("/samaritans/:id") do
	@samaritan = GoodSamaritan.find(params.fetch("id").to_i())
	animal_type = params.fetch("animal_type")
	description = params.fetch("description")
	location = params.fetch("location")
	time = params.fetch("time")
	good_samaritan_id = params.fetch("id").to_i()
	sex = params.fetch("sex")

	if params.fetch("possession").first() == "false"
		possession = false
	elsif params.fetch("possession").first() == "true"
		possession = true
	end

	if params.fetch("news").first() == "false"
		news = false
	elsif params.fetch("news").first() == "true"
		news = true
	end

	test_ticket=ChildTicket.new({:animal_type => animal_type,:description => description,:location => location,:time => time,:possession => possession, :sex => sex, :news => news, :good_samaritan_id => good_samaritan_id})
	test_ticket.save
	erb(:samaritan)
end


#######################################
#########___Organizations Page___######
#######################################
get("/organizations") do
	@organizations = Organization.all()
	erb(:organizations)
end

#########################################
#########___Organization Form___#########
#########################################

get("/organizations/new") do
	@organizations = Organization.all()
	erb(:organizations_form)
end

post("/organizations") do
	name = params.fetch("name")
	address = params.fetch("address")
	phone = params.fetch("phone")
	social = params.fetch("social")
	contact_name = params.fetch("contact_name")
	hours = params.fetch("hours")
	mission_statement = params.fetch("mission_statement")
	email = params.fetch("email")
	website = params.fetch("website")
	@organization = Organization.new({:name => name, :address => address, :phone => phone, :social => social, :contact_name => contact_name, :hours => hours, :mission_statement => mission_statement, :email => email, :website => website})

	if @organization.save()
	@organizations = Organization.all()
	erb(:organizations)
	else
	erb(:organizations_errors)
  end
end

##########################################
#########___Organization-Page___##########
##########################################
get("/organizations/:id") do
 	@parent_tickets = ParentTicket.all()
	@organization = Organization.find(params.fetch("id").to_i())
	erb(:organization)
end

get('/organizations/:id/manage') do
 	@organization = Organization.all
	@child_tickets = ChildTicket.all
	@parent_tickets = ParentTicket.all
	# organization_id = @parent_tickets.find(params.fetch("organization_id").to_i())
	erb(:parent_tickets_list)
end

get('/organizations/:id/new_parent') do
	@organization = Organization.find(params.fetch("id").to_i)
	erb(:organization_new_ticket)
end

post('/organizations/:id') do
	@organization = Organization.find(params.fetch('id').to_i())
	# @child_ticket = ChildTicket.all()
	@name = params.fetch("name")
	organization_id = params.fetch('id').to_i()


	if params.fetch("sterilized").first() == "false"
		@sterilized = false
	elsif params.fetch("sterilized").first() == "true"
		@sterilized = true
	end
	@picture = params.fetch("picture")
	if params.fetch("adoption_ready").first() == "false"
		@adoption_ready = false
	elsif params.fetch("adoption_ready").first() == "true"
		@adoption_ready = true
	end

  @parent_ticket = ParentTicket.new({:name => @name, :sterilized => @sterilized, :adoption_ready => @adoption_ready, :picture => @picture, :organization_id => organization_id})
	@parent_ticket.save

  erb(:organization)
end




get("/orgnizations/:id/parent_tickets/:parent_ticket_id") do
	@organization = Organization.find(params.fetch("id").to_i())
	@child_tickets = ChildTicket.all
	@parent_ticket = ParentTicket.find(params.fetch("parent_ticket_id"))
	if @child_ticket.possession() == true
		@insert_possession = ""
	else
		@insert_possession = "no"
	end

	if @child_ticket.news() == true
		@insert_news = "a"
	else
		@insert_news = "no"
	end
	erb(:parent_ticket)
end






####################################
#########___Tickets-List___#########
####################################
get("/samaritans/:id/tickets_list") do
	@samaritan = GoodSamaritan.find(params.fetch("id").to_i())
	erb(:tickets_list)
end

####################################
#########___Ticket-Page___##########
####################################
get("/samaritans/:id/tickets/:child_ticket_id") do
	@samaritan = GoodSamaritan.find(params.fetch("id").to_i())
	@child_ticket = ChildTicket.find(params.fetch("child_ticket_id").to_i())
	if @child_ticket.possession() == true
		@insert_possession = ""
	else
		@insert_possession = "no"
	end

	if @child_ticket.news() == true
		@insert_news = "a"
	else
		@insert_news = "no"
	end
	erb(:child_ticket)
end
