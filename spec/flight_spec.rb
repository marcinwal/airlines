require './app/flight.rb'


describe Flight do 

  let(:route){Route.new(:origin=>"London",:destination=>"Dublin",
                        :cost_PP=>100,:ticket_px=>150,
                        :min_takeff=>75)}
  let(:plane){Aircraft.new(:name=>"Cessna",
                           :number_of_seats=>3)}

  let(:general_passanger1){General_passanger.new(:name=>"Olo",
                          :age=>38)}                        

  let(:airline_passanger1){Airline_passanger.new(:name=>"Boss",
                          :age=>58)}  
  
  let(:loyalty_passanger1){Loyalty_passanger.new(:name=>"Loyal",
                          :age=>28,:points=>120,:use_points=>true,
                          :extra_luggage=>true)}  
  let(:flight){Flight.new()}

  it 'should have start without passangers and one if added' do 
    expect(flight.passangers.count).to eq(0)    
    flight.add_passanger(general_passanger1)
    expect(flight.passangers.count).to eq(1)
  end

  it 'should add plane' do 
    expect(flight.aircraft.count).to equal(0)
    flight.add_aircraft(plane)
    expect(flight.aircraft.count).to equal(1)
  end

  it 'should add route' do 
    expect(flight.route.count).to equal(0)
    flight.add_route(plane)
    expect(flight.route.count).to equal(1)
  end

  it 'should count passangers per class' do 
    flight.add_passanger(general_passanger1)
    expect(flight.count_passangers_type(:general_passanger)).to equal(1)
    expect(flight.count_passangers_type(:airline_passanger)).to equal(0)
    expect(flight.count_passangers_type(:loyalty_passanger)).to equal(0) 
    flight.add_passanger(airline_passanger1)
    expect(flight.count_passangers_type(:airline_passanger)).to equal(1)        
  end

  it 'should count total number of bags' do 
    flight.add_passanger(general_passanger1)
    flight.add_passanger(loyalty_passanger1)
    expect(flight.number_of_bags).to eq(3)
    flight.add_passanger(airline_passanger1)
    expect(flight.number_of_bags).to eq(4)
  end

end