require './app/route.rb'

describe Route do
  let(:route){Route.new(:origin=>"London",:destination=>"Dublin",
                        :cost_pp=>100,:ticket_px=>150,:min_takeoff=>75)}

  it "should have the proper route " do 
    expect(route.destination).to eq("Dublin")
    expect(route.origin).to eq("London")
  end


end