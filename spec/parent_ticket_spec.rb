require('spec_helper')

######### VALIDATE and NORMALIZE Name #########
describe(ParentTicket) do
  it("validates presence of a parent_ticket name") do
    test_parent_ticket = ParentTicket.new({:name => ""})
    expect(test_parent_ticket.save()).to(eq(false))
  end
end

describe(ParentTicket) do
  it("normalizes the name - lower case it then title case") do
    test_shot = Shot.create({:name => 'lymevax'})
    test_parent_ticket = ParentTicket.create({:name => "beLlA", :shot_ids => [test_shot.id()], :sterilized => true, :adoption_ready => true, :picture => "None" })
    expect(test_parent_ticket.name()).to(eq("Bella"))
  end
end

####### INPUT CHECK ########
describe(ParentTicket) do
  describe("#shots") do
    it('shows which shots a parent_ticket was administered and vice versa') do
      test_shot = Shot.create({:name => 'Lymevax'})
      test_parent_ticket = ParentTicket.create({:name => 'Bella', :shot_ids => [test_shot.id()]})
      expect(test_parent_ticket.shot_ids()).to(eq([test_shot.id()]))
      expect(test_shot.parent_tickets()).to(eq([test_parent_ticket]))
    end
  end

  describe("#update") do
    it('can remove a parent_ticket from a shot') do
      test_shot = Shot.create({:name => 'Lymevax'})
      test_parent_ticket = ParentTicket.create({:name => 'Bella'})

      test_parent_ticket.update({:shot_ids => []})
      expect(test_parent_ticket.shot_ids()).to(eq([]))
      expect(test_shot.parent_tickets()).to(eq([]))

      test_parent_ticket.update({:shot_ids => [test_shot.id()]})
      test_shot = Shot.find(test_shot.id())
      expect(test_parent_ticket.shot_ids()).to(eq([test_shot.id()]))
      expect(test_shot.parent_tickets()).to(eq([test_parent_ticket]))
    end
  end
end

describe(ParentTicket) do
  it("checks the status of sterilization of the parent_ticket") do
    not_sterilized = ParentTicket.new({:sterilized => nil})
    expect(not_sterilized.save()).to(eq(false))
  end
end

describe(ParentTicket) do
  it("checks the status of adoption_ready of the parent_ticket") do
      not_adoption_ready = ParentTicket.new({:adoption_ready => nil})
      expect(not_adoption_ready.save()).to(eq(false))
    end
  end

describe(ParentTicket) do
  it("ensures the parent_ticket has a picture-entry as entered") do
    test_picture = ParentTicket.new({:picture => 'None'})
    expect(test_picture.picture()).to(eq("None"))
  end
end
