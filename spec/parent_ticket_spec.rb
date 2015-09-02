require('spec_helper')



describe(Parent_ticket) do
  it("validates presence of a parent_ticket name") do
    test_parent_ticket = Parent_ticket.new({:name => ""})
    expect(test_parent_ticket.save()).to(eq(false))
  end
end

describe(Parent_ticket) do
  it("normilizes the name - lower case it then title case") do
    test_shot = Shot.create({:name => 'lymevax'})
    test_parent_ticket = Parent_ticket.create({:name => "beLlA", :shot_ids => [test_shot.id()]})
    expect(test_parent_ticket.name()).to(eq("Bella"))
    expect(test_shot.parent_ticket_ids()).to(eq([test_parent_ticket_id]))
  end
end


# describe(Parent_ticket) do
#   describe("#shots") do
#     it('shows which shots a parent_ticket is administered and vice versa') do
#       test_shot = Shot.create({:name => 'lymevax'})
#       test_parent_ticket = Parent_ticket.create({:name => 'Bella', :shot_ids => [test_shot.id()]})
#
#       expect(test_parent_ticket.shot_ids()).to(eq([test_shot.id()]))
#
#       expect(test_shot.parent_tickets()).to(eq([test_parent_ticket]))
#
#     end
#   end

  # describe("#update") do
  #   it('can remove a parent_ticket from a shot') do
  #     test_shot = Shot.create({:name => 'lymevax'})
  #     test_parent_ticket = Parent_ticket.create({:name => 'Bella', :shot_ids => [test_shot.id()]})
  #
  #     test_parent_ticket.update({:shot_ids => []})
  #     expect(test_parent_ticket.shot_ids()).to(eq([]))
  #     expect(test_shot.parent_tickets()).to(eq([]))
  #
  #     test_parent_ticket.update({:shot_ids => [test_shot.id()]})
  #     test_shot = Shot.find(test_shot.id())
  #     expect(test_parent_ticket.shot_ids()).to(eq([test_shot.id()]))
  #     expect(test_shot.parent_tickets()).to(eq([test_parent_ticket]))
  #   end
  # end
# end
