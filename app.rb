require('pg')
require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/GoodSamaritan')
require('./lib/ChildTicket')
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

	if params.fetch("posession").first() == "false"
		posession = false
	elsif params.fetch("posession").first() == "true"
		posession = true
	end

	if params.fetch("news").first() == "false"
		news = false
	elsif params.fetch("news").first() == "true"
		news = true
	end

	test_ticket=ChildTicket.new({:animal_type => animal_type,:description => description,:location => location,:time => time,:posession => posession, :sex => sex, :news => news, :good_samaritan_id => good_samaritan_id})
	test_ticket.save
	erb(:samaritan)
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
	if @child_ticket.posession() == true
		@insert_posession = ""
	else
		@insert_posession = "no"
	end

	if @child_ticket.news() == true
		@insert_news = "a"
	else
		@insert_news = "no"
	end
	erb(:child_ticket)
end
