require './app/flight.rb'
require './app/route.rb'

describe Flight do 

  let(:route){Route.new(:origin=>"London",:destination=>"Dublin",
                        :cost_PP=>100,:ticket_px=>150,
                        :min_takeff=>75)}
  let(:plane){Aircraft.new(:name=>"Cessna",
                           :number_of_seats=>3)}

  let(:general_passanger){General_passanger.new(:name=>"Olo",
                          :age=>38)}                        

  let(:airline_passanger){Airline_passanger.new(:name=>"Boss",
                          :age=>58)}  
  
  let(:loyalty_passanger){Loyalty_passanger.new(:name=>"Loyal",
                          :age=>28,:points=>120,:use_points=>true,
                          :extra_luggage=>true)}  
  let(:flight){Flight.new()}

  it 'should have start without passangers and one if added' do 
    expect(flight.count_passangers).to eq(0)    
    flight.add_passanger(general_passanger)
    expect(flight.count_passangers).to eq(1)
  end

  it 'should add plane' do 
    expect(flight.aircraft.count).to equal(0)
    flight.add_aircraft(plane)
    expect(flight.aircraft.count).to equal(1)
  end
end