require_relative '../app/file_helper.rb'

describe File_helper do

  let(:sample_data_file){'../sample.txt'}
  let(:tester){(Class.new{include File_helper}).new}


  it "should load a flight route" do
    route,aircraft,passangers = tester.load_file(sample_data_file)
    expect(route).to eq({origin => 'London',destination => 'Dublin',
                         cost => 100, ticket_price => 150,
                         min_takeoff => 50})
  end

end