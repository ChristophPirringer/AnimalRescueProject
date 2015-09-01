require('spec_helper')

describe(GoodSamaritan) do
  it {should have_many(:child_tickets)}

  before() do
    @peter = GoodSamaritan.new({:name => "", :email => "", :phone_number => nil})
    @peter.save
    @paul = GoodSamaritan.new({:name => "Paul", :email => "none@no.one", :phone_number => 5555555})
    @paul.save
  end

  it("ensures a name exists") do
    expect(@peter.save()).to(eq(false))
  end

  it("ensures an email-address exists") do
    expect(@peter.save()).to(eq(false))
  end

  it("ensures a phone-number exists") do
    expect(@peter.save()).to(eq(false))
  end

   it("ensures Paul has a name as entered") do
     expect(@paul.name()).to(eq("Paul"))
   end

   it("ensures Paul has an email-address as entered") do
     expect(@paul.email()).to(eq("none@no.one"))
   end

   it("ensures Paul has a phone_number as entered") do
     expect(@paul.phone_number()).to(eq(5555555))
   end

end
