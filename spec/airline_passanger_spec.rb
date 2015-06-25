require './app/airline_passanger.rb'



describe Airline_passanger do 

  let(:airline_passanger){Airline_passanger.new(:name=>"CEO",:age=>55)}

  it 'should pay 0 price' do
    expect(airline_passanger.calc_final_price(:initial=>100.0)).to eq(0.0)
  end

end