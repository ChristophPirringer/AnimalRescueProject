require('spec_helper')


######### VALIDATE names & phone and NORMALIZE names #########
describe(Organization) do
  it("validates presence of an organization name, contact_name, phone(numbers only), mission statement") do
    test_organization = Organization.new({:name => ""})
    expect(test_organization.save()).to(eq(false))

    test_contact_name = Organization.new({:contact_name => ""})
    expect(test_contact_name.save()).to(eq(false))

    test_phone = Organization.new({:phone => ""})
    expect(test_phone.save()).to(eq(false))

    test_email = Organization.new({:email => ""})
    expect(test_email.save()).to(eq(false))
  end
end

describe(Organization) do
  it("normalizes the organization and client names - lower case it then title case") do
    test_organization = Organization.create({:name => "von dubinhAUs sHepHERds", :contact_name => "bRandOn sEROyer", :phone => 1234567890, :email => "tester@testing.com", :address => "123 main st, anycity 12345", :mission_statement => "At Von Dubinhaus Shepherds, we are committed to German Shepherd Dogs and the integrity of the breed.  We strive to assist Shepherds who have gotten themselves in trouble and  work to rehabilitate these dogs to the point that they are ready for second chance at a forever-home.At Von Dubinhaus Shepherds, we are committed to German Shepherd Dogs and the integrity of the breed.  We strive to assist Shepherds who have gotten themselves in trouble and  work to rehabilitate these dogs to the point that they are ready for second chance at a forever-home."})

    test_organization.save
    expect(test_organization.name()).to(eq("Von Dubinhaus Shepherds"))

  end
end

describe(Organization) do
  it("normalizes the client name - lower case it then title case") do
    test_organization = Organization.create({:name => "von dubinhAUs sHepHERds", :contact_name => "bRandOn sEROyer", :phone => 1234567890, :email => "tester@testing.com", :address => "123 main st, anycity 12345", :mission_statement => "At Von Dubinhaus Shepherds, we are committed to German Shepherd Dogs and the integrity of the breed.  We strive to assist Shepherds who have gotten themselves in trouble and  work to rehabilitate these dogs to the point that they are ready for second chance at a forever-home.At Von Dubinhaus Shepherds, we are committed to German Shepherd Dogs and the integrity of the breed.  We strive to assist Shepherds who have gotten themselves in trouble and  work to rehabilitate these dogs to the point that they are ready for second chance at a forever-home."})
    test_organization.save
    expect(test_organization.contact_name()).to(eq("Brandon Seroyer"))
    end
  end

# describe(Organization) do
#   it("checks if the mission statement is under 500 chars") do
#     test_mission_statement = Organization.new({:name => "von dubinhAUs sHepHERds", :contact_name => "bRandOn sEROyer", :phone => 1234567890, :email => "tester@testing.com", :address => "123 main st, anycity 12345", :mission_statement => "At Von Dubinhaus Shepherds, we are committed to German Shepherd Dogs and the integrity of the breed.  We strive to assist Shepherds who have gotten themselves in trouble and  work to rehabilitate these dogs to the point that they are ready for second chance at a forever-home.At Von Dubinhaus Shepherds, we are committed to German Shepherd Dogs and the integrity of the breed.  We strive to assist Shepherds who have gotten themselves in trouble and  work to rehabilitate these dogs to the point that they are ready for second chance at a forever-home.At Von Dubinhaus Shepherds, we are committed to German Shepherd Dogs and the integrity of the breed.  We strive to assist Shepherds who have gotten themselves in trouble and  work to rehabilitate these dogs to the point that they are ready for second chance at a forever-home.At Von Dubinhaus Shepherds, we are committed to German Shepherd Dogs and the integrity of the breed.  We strive to assist Shepherds who have gotten themselves in trouble and  work to rehabilitate these dogs to the point that they are ready for second chance at a forever-home.At Von Dubinhaus Shepherds, we are committed to German Shepherd Dogs and the integrity of the breed.  We strive to assist Shepherds who have gotten themselves in trouble and  work to rehabilitate these dogs to the point that they are ready for second chance at a forever-home."})
#       if test_mission_statement.mission_statement.length > 500
#         false
#       else
#     expect(test_mission_statement.mission_statement()).to(eq(test_mission_statement))
#     end
#   end
# end
