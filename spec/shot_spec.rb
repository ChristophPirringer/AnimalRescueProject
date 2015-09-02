require('spec_helper')

describe(Shot) do
  it("saves a Shot to db") do
    test_shot = Shot.create({:name => "Lymevax"})
    expect(test_shot).to(eq(test_shot))
  end
end

describe(Shot) do
  it("validates presence of Shot name") do
    test_shot = Shot.new({:name => ""})
    expect(test_shot.save()).to(eq(false))
  end
end

describe(Shot) do
  it("normilizes the name - lower case it then title case") do
    shot = Shot.create({:name => "lymeVax"})
    expect(shot.name()).to(eq("Lymevax"))
  end
end
