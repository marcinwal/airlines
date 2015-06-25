require './app/airline_passanger.rb'

let(:airline_passanger){Airline_passanger.new(:name=>"CEO",:age=>55)}

describe Airline_passanger do 
  it 'should have discount 100%'
    expect(airline_passanger.discount).to eq(100.0)
  end
end