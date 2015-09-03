require('capybara/rspec')
require('./app')
require("spec_helper")

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


#################################################################
#####################---Organization Path---###################
#################################################################

describe('adding a new rescue organization', {:type => :feature}) do
  it('allows a user to add a new organization') do
    visit('/')
    click_link('Rescue Organizations')
    click_link('Submit a new Organization')
    fill_in('name', :with => 'Von Dubinhaus Shepherds')
    fill_in('address', :with => '3711 SW Pomona St, Portland, OR 97219')
    fill_in('phone', :with => '(503) 806-2572')
    fill_in('email', :with => 'vondubinhaus@gmail.com')
    fill_in('social', :with => 'https://www.facebook.com/pages/Von-Dubinhaus-Shepherds/202535683142444')
    fill_in('contact_name', :with => 'Brandon Seroyer')
    fill_in('hours', :with => '9-5')
    fill_in('mission_statement', :with => 'Von Dubinhaus Shepherds is a Dog Rescue Orgaization located in Portland, OR.  German Shepherd Dogs are our passion, we specialize in rehabbing troubled Shepherds in need of a second chance and then placing them in homes that will allow them to thrive in the future.')
    click_button('Add Organization')
    expect(page).to have_content('Von Dubinhaus Shepherds')
  end
end



#################################################################
#####################---Parent Ticket Path---###################
#################################################################
describe('adding a new parent ticket(animal)', {:type => :feature}) do
  it('allows a user to add a new animal and see it on the parent ticket page') do
    visit('/')
    click_link('Rescue Organizations')
    click_button('Von Dubinhaus Shepherds')
    click_link('Submit a new Animal')
    fill_in('name', :with => 'Bella')
    check('child_tickets')
    check('Sterilized')
    check('Adoption-Ready')
# attach_file('Image', '/path/to/image.jpg')
# select('Option', :from => 'Select Box')
    fill_in('picture', :with => "https://upload.wikimedia.org/wikipedia/commons/9/96/Buck_The_GSD.jpg")
    click_button('Add Animal')
    expect(page).to have_content('Bella')
  end
end
