require './app/report.rb'

describe Report do 
  let(:report){Report.new}
  let(:input_file){'./sample1.txt'}
  let(:output_file){'./dest1.txt'}

  it 'should extract and add route' do 
    report.set_files
    expect(report.flight.route.length).to eq(0)
    report.extract_route
    expect(report.flight.route.length).to eq(1)
  end

  it 'should extract and add aircrafts' do 
    report.set_files
    expect(report.flight.aircraft.length).to eq(0)
    report.extract_aircraft
    expect(report.flight.aircraft.length).to eq(1)
    p report.flight.aircraft[0]
  end

  it 'should extract and add passangers' do 
    report.set_files
    expect(report.flight.passangers.length).to eq(0)
    report.extract_general_passanger
    expect(report.flight.passangers.length).to eq(3)
    report.extract_airline_passanger
    expect(report.flight.passangers.length).to eq(4)
    report.extract_loyalty_passanger
    expect(report.flight.passangers.length).to eq(5)
  end

  it 'should generate a report' do 
    report.set_files
    report.extract_route
    report.extract_aircraft
    report.extract_general_passanger
    report.extract_airline_passanger
    report.extract_loyalty_passanger
    result = report.prepare_report
    p result
  end

end