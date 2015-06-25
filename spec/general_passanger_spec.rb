require './app/general_passanger.rb'

describe General_passanger do 

  let(:passanger){General_passanger.new(:name => "Tom",:age=>24)}

  it 'should create a simple passange and he should have a luggage' do 
    expect(passanger.name).to eq("Tom")
    expect(passanger.age).to eq(24)
    expect(passanger.luggage).to eq(1)
  end

  it 'should pay regular price' do
    expect(passanger.calc_final_price(:initial=>100.0)).to eq(100.0)
  end

end