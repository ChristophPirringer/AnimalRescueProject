require('spec_helper')



describe(ParentTicket) do
  it("validates presence of a parent_ticket name") do
    test_parent_ticket = ParentTicket.new({:name => ""})
    expect(test_parent_ticket.save()).to(eq(false))
  end
end

describe(ParentTicket) do
  it("normilizes the name - lower case it then title case") do
    test_shot = Shot.create({:name => 'lymevax'})
    test_parent_ticket = ParentTicket.create({:name => "beLlA", :shot_ids => [test_shot.id()], :sterilized => true, :adoption_ready => true, :picture => "None" })
    expect(test_parent_ticket.name()).to(eq("Bella"))
  end
end
