require('capybara/rspec')
require('./app')
require("spec_helper")

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


#################################################################
#####################---Good_Samaritan-Path---###################
#################################################################
describe('adding a new Good Samaritan', {:type => :feature}) do
	it('allows a user to add a new Good Samaritan and see it on the samaritans-page') do
		visit('/')
    click_link('Samaritans')
    click_link('Submit a new Good Samaritan!')
		fill_in('name', :with => 'metallica')
    fill_in('email', :with => 'none@no.one')
    fill_in('phone_number', :with => 5)
		click_button('Add Samaritan')
		expect(page).to have_content('metallica')
  end

  it('does not allow a user to add a new Good Samaritan and see it on the samaritans-page if the name is missing') do
		visit('/')
    click_link('Samaritans')
    click_link('Submit a new Good Samaritan!')
		fill_in('name', :with => '')
    fill_in('email', :with => 'this@no.one')
    fill_in('phone_number', :with => 5)
		click_button('Add Samaritan')
		expect(page).to have_no_content('this@no.one')
  end

  it('does not allow a user to add a new Good Samaritan and see it on the samaritans-page if the email address is missing') do
		visit('/')
    click_link('Samaritans')
    click_link('Submit a new Good Samaritan!')
		fill_in('name', :with => 'metallica')
    fill_in('email', :with => '')
    fill_in('phone_number', :with => 5)
		click_button('Add Samaritan')
		expect(page).to have_no_content('metallica')
  end

  it('does not allow a user to add a new Good Samaritan and see it on the samaritans-page if the phone number is missing') do
    visit('/')
    click_link('Samaritans')
    click_link('Submit a new Good Samaritan!')
    fill_in('name', :with => 'metallica')
    fill_in('email', :with => 'none@no.one')
    fill_in('phone_number', :with => nil)
    click_button('Add Samaritan')
    expect(page).to have_no_content('metallica')
  end

  it('allows a user to visit the page of the Good Samaritan just entered') do
    visit('/')
    click_link('Samaritans')
    click_link('Submit a new Good Samaritan!')
    fill_in('name', :with => 'metallica')
    fill_in('email', :with => 'none@no.one')
    fill_in('phone_number', :with => 5)
    click_button('Add Samaritan')
    click_link('metallica')
    expect(page).to have_content('Submit a ticket!')
  end
end


#################################################################
######################---Child_Ticket-Path---####################
#################################################################
describe('adding a new Child_Ticket', {:type => :feature}) do
  it('allowsa user to add a ticket to the Good Samaritan and view it on the Samaritans ticket-listing') do
    visit('/')
    click_link('Samaritans')
    click_link('Submit a new Good Samaritan!')
    fill_in('name', :with => 'metallica')
    fill_in('email', :with => 'none@no.one')
    fill_in('phone_number', :with => 5)
    click_button('Add Samaritan')
    click_link('metallica')
    click_link('Submit a ticket!')
    fill_in('type', :with => 'bear')
    fill_in('description', :with => 'big')
    fill_in('location', :with => 'Bearlin')
    fill_in('time', :with => 'now')
    fill_in('sex', :with => 'a lot')
    # find(:css, "#posession[value='true']").set(true)
    # find(:css, "#news[value='true']").set(true)
    click_button ('Submit TIcket!')
    click_link('View and edit your tickets!')
    expect(page).to have_content('bear')
  end
end
