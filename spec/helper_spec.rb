require_relative '../app/file_helper.rb'

describe File_helper do

  let(:sample_data_file){'./sample1.txt'}
  let(:tester){(Class.new{include File_helper}).new}
  let(:pattern){{:route_pattern => /add route \D+ \D+ \d+ \d+ \d+/,
                 :aircraft_pattern => /add aircraft \S+ \d/,
                 :general_pattern => /add general \D+ \d{1,3}/,
                 :airline_pattern => /add airline \D+ \d{1,3}/,
                 :loyalty_pattern => /add loyalty \D+ \d{1,3} \d+ (TRUE|FALSE) (TRUE|FALSE)/}}


  it "should load a flight route" do
    dictionary = tester.load_file(sample_data_file,pattern)
    expect(dictionary[:route_pattern].length).to eq(1)
  end

  it "should load an aircraft route" do
    dictionary = tester.load_file(sample_data_file,pattern)
    expect(dictionary[:aircraft_pattern].length).to eq(1)
  end

  it "should load 3 general passangers" do 
    dictionary = tester.load_file(sample_data_file,pattern)
    expect(dictionary[:general_pattern].length).to eq(3)
  end

  it "should load 1 airline passangers" do 
    dictionary = tester.load_file(sample_data_file,pattern)
    expect(dictionary[:airline_pattern].length).to eq(1)
  end

  it "should load 1 general loyalty" do 
    dictionary = tester.load_file(sample_data_file,pattern)
    expect(dictionary[:loyalty_pattern].length).to eq(1)
  end  

end