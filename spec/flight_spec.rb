require './app/flight.rb'


describe Flight do 

  let(:route){Route.new(:origin=>"London",:destination=>"Dublin",
                        :cost_pp=>100,:ticket_px=>150,
                        :min_takeoff=>60)}
  let(:plane){Aircraft.new(:name=>"Cessna",
                           :number_of_seats=>3)}
  let(:plane_single){Aircraft.new(:name=>"Sport",
                           :number_of_seats=>1)}

  let(:general_passanger1){General_passanger.new(:name=>"Olo",
                          :age=>38)}                        

  let(:airline_passanger1){Airline_passanger.new(:name=>"Boss",
                          :age=>58)}  
  
  let(:loyalty_passanger1){Loyalty_passanger.new(:name=>"Loyal",
                          :age=>28,:points=>120,:use_points=>true,
                          :extra_luggage=>true)}  
  let(:flight){Flight.new}

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
    flight.add_route(route)
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

  it 'should calculate the whole cost and unajusted revenue' do 
    flight.add_route(route)
    flight.add_passanger(general_passanger1)
    flight.add_passanger(loyalty_passanger1)
    expect(flight.total_cost).to eq(200)  
    expect(flight.total_unadjusted_revenue).to eq(300)  
  end

  it 'should calculate adjusted revenue' do 
    flight.add_route(route)
    flight.add_passanger(general_passanger1)
    flight.add_passanger(loyalty_passanger1)  
    flight.add_passanger(airline_passanger1)
    expect(flight.total_adjusted_revenue).to eq(180)
  end 
    
  it 'should calculate redeemed points' do 
    flight.add_route(route)
    flight.add_aircraft(plane)
    flight.add_passanger(general_passanger1)
    flight.add_passanger(loyalty_passanger1)  
    flight.add_passanger(airline_passanger1)
    expect(flight.total_adjusted_revenue).to eq(180)
    expect(flight.redeemed_points).to eq(120)
  end

  it 'should know if takeoff is allowed' do 
    flight.add_route(route)
    flight.add_aircraft(plane)
    flight.add_passanger(general_passanger1)
    expect(flight.take_off_allowed?).to be(false)
    flight.add_passanger(loyalty_passanger1)   
    expect(flight.take_off_allowed?).to be(true)
  end

  it 'should know when the flight is full' do 
    flight.add_route(route)
    flight.add_aircraft(plane_single)
    expect(flight.full?).to be false
    flight.add_passanger(general_passanger1)
    expect(flight.full?).to be true
  end

end