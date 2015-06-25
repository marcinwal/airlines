require './app/aircraft.rb'

describe Aircraft do   
  let(:aircraft){Aircraft.new(:name=>'Boeing737',
                              :number_of_seats=>787)}
  let(:tiny_aircraft){Aircraft.new(:name=>'Tiny1',
                              :number_of_seats=>1)}

  it 'should be able to initialize the aircraft' do 
    expect(aircraft.number_of_seats).to eq(787)
    expect(aircraft.name).to eq("Boeing737")
  end

  it 'should be full after all seats are taken' do 
    tiny_aircraft.add_passanger
    expect(tiny_aircraft.full?).to be(true)
  end

end