require './app/route.rb'

describe Route do
  let(:route){Route.new(:origin=>"London",:destination=>"Dublin",
                        :cost_pp=>100,:ticket_px=>150,:min_takeoff=>75)}

  it "should have the proper route " do 
    expect(route.destination).to eq("Dublin")
    expect(route.origin).to eq("London")
  end

  it "should calculate cost of flight" do 
    expect(route.calc_cost(:how_many=>10)).to eq(1000)
  end

  it "should not be allowed to take off if capacity below 75pct" do 
    expect(route.take_off_allowed?(60,100)).to be(false)
  end

  it "should be allowed to take off if capacity above 75pct" do 
    expect(route.take_off_allowed?(75,100)).to be(true)
  end

  it "should not be allowed to take off if capacity above 100pct" do 
    expect(route.take_off_allowed?(201,200)).to be(false)
  end

end