require('spec_helper')

describe(ChildTicket) do
  it {should belong_to (:good_samaritan)}

  before() do
    @failed_sighting = ChildTicket.new({:animal_type => "", :description => "", :location => "", :time => nil, :posession => nil, :sex => "", :news => nil})
    @failed_sighting.save
    @sighting = ChildTicket.new({:animal_type => "Dog", :description => "angry", :location => "here", :time => "afternoon", :posession => true, :sex => "male", :news => true})
    @sighting.save
  end

  it("ensures an animal_type exists") do
    expect(@failed_sighting.save()).to(eq(false))
  end

  it("ensures a description exists") do
    expect(@failed_sighting.save()).to(eq(false))
  end

  it("ensures a location exists") do
    expect(@failed_sighting.save()).to(eq(false))
  end

  it("ensures a time-entry exists") do
    expect(@failed_sighting.save()).to(eq(false))
  end

  it("ensures a posession-entry exists") do
    expect(@failed_sighting.save()).to(eq(false))
  end

  it("ensures an animal_type exists") do
    expect(@failed_sighting.save()).to(eq(false))
  end

  it("ensures an animal_type exists") do
    expect(@failed_sighting.save()).to(eq(false))
  end

   it("ensures the sighting has a description as entered") do
     expect(@sighting.description()).to(eq("angry"))
   end

   it("ensures the sighting has a location as entered") do
     expect(@sighting.location()).to(eq("here"))
   end

   it("ensures the sighting has a time as entered") do
     expect(@sighting.time()).to(eq("afternoon"))
   end

   it("ensures the sighting has a posession-entry as entered") do
     expect(@sighting.posession()).to(eq(true))
   end

   it("ensures the sighting has a sex as entered") do
     expect(@sighting.sex()).to(eq("male"))
   end

   it("ensures the sighting has an news-status as entered") do
     expect(@sighting.news()).to(eq(true))
   end

end
