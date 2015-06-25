require './app/loyalty_passanger.rb'

describe Loyalty_passanger do
  let(:loyalty_passanger){Loyalty_passanger.new(:name=>"Platinium",:age=>42,
                                                :points=>50,:use_points=>true,
                                                :extra_luggage=>true)}
  it "should have points " do 
    expect(loyalty_passanger.points).to eq(50)
    expect(loyalty_passanger.name).to eq('Platinium')
  end

  it "should have two suitcases" do 
    expect(loyalty_passanger.luggage).to eq(2)
  end

  it 'should have discount price and loose all points' do 
    expect(loyalty_passanger.calc_final_price(:initial=>100.0)).to eq(50.0)
    expect(loyalty_passanger.points).to eq(0)
  end

  it 'should have discount price and loose some points' do 
    expect(loyalty_passanger.calc_final_price(:initial=>40.0)).to eq(0.0)
    expect(loyalty_passanger.points).to eq(10.0)
    expect(loyalty_passanger.redeemed).to eq(40)
  end

end