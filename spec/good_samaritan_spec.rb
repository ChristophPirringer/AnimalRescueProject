require('spec_helper')

describe(GoodSamaritan) do
  it {should have_many(:child_tickets)}

  it("ensures a name exists") do
    peter = GoodSamaritan.new({:name => ""})
    expect(peter.save()).to(eq(false))
  end

  it("ensures an email-address exists") do
    peter = GoodSamaritan.new({:email => ""})
    expect(peter.save()).to(eq(false))
  end

  it("ensures a phone-number exists") do
    peter = GoodSamaritan.new({:phone_number => ""})
    expect(peter.save()).to(eq(false))
  end

   it("ensures Peter has a name as entered") do
     peter = GoodSamaritan.create({:name => "Peter", :email => "none@no.one", :phone_number => 5555555})
     expect(peter.name()).to(eq("Peter"))
   end

   it("ensures Peter has an email-address as entered") do
     peter = GoodSamaritan.create({:name => "Peter", :email => "none@no.one", :phone_number => 5555555})
     expect(peter.email()).to(eq("none@no.one"))
   end

   it("ensures Peter has a phone_number as entered") do
     peter = GoodSamaritan.create({:name => "Peter", :email => "none@no.one", :phone_number => 5555555})
     expect(peter.phone_number()).to(eq(5555555))
   end

end
