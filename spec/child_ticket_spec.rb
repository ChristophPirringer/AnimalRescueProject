require('spec_helper')

describe(ChildTicket) do
  it {should belong_to (:good_samaritan)}


  ###############################################
  #############__Object-Creation__###############
  ###############################################
  before() do
    @sighting = ChildTicket.new({:animal_type => "Dog", :description => "angry", :location => "here", :time => "afternoon", :picture => "none", :posession => true, :sex => "male", :news => true})
    @sighting.save
  end


  ###############################################
  #############__Input-Validation__##############
  ###############################################
  it("ensures an animal_type-entry exists") do
    failed_sighting = ChildTicket.new({:animal_type => ""})
    expect(failed_sighting.save()).to(eq(false))
  end

  it("ensures a description-entry exists") do
    failed_sighting = ChildTicket.new({:description => ""})
    expect(failed_sighting.save()).to(eq(false))
  end

  it("ensures a location-entry exists") do
    failed_sighting = ChildTicket.new({:location => ""})
    expect(failed_sighting.save()).to(eq(false))
  end

  it("ensures a time-entry exists") do
    failed_sighting = ChildTicket.new({:time => nil})
    expect(failed_sighting.save()).to(eq(false))
  end

  it("ensures a picture-entry exists") do
    failed_sighting = ChildTicket.new({:picture => ""})
    expect(failed_sighting.save()).to(eq(false))
  end

  it("ensures a posession-selection exists") do
    failed_sighting = ChildTicket.new({:posession => nil})
    expect(failed_sighting.save()).to(eq(false))
  end

  it("ensures an sex-entry exists") do
    failed_sighting = ChildTicket.new({:sex => "", :news => nil})
    expect(failed_sighting.save()).to(eq(false))
  end

  it("ensures an news-selection exists") do
    failed_sighting = ChildTicket.new({:news => nil})
    expect(failed_sighting.save()).to(eq(false))
  end


  ###############################################
  #########__Attribute-Verification__############
  ###############################################
   it("ensures the sighting has a description as entered") do
     expect(@sighting.description()).to(eq("angry"))
   end

   it("ensures the sighting has a location as entered") do
     expect(@sighting.location()).to(eq("here"))
   end

   it("ensures the sighting has a time as entered") do
     expect(@sighting.time()).to(eq("afternoon"))
   end

   it("ensures the sighting has a picture-entry as entered") do
     expect(@sighting.picture()).to(eq("none"))
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
