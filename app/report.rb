require 'byebug'
require './app/setup.rb'
class Report

  PATTERNS = {:route => /add route \D+ \D+ \d+ \d+ \d+/,
             :aircraft => /add aircraft \S+ \d/,
             :general_passanger => /add general \D+ \d{1,3}/,
             :airline_passanger => /add airline \D+ \d{1,3}/,
             :loyalty_passanger => /add loyalty \D+ \d{1,3} \d+ (TRUE|FALSE) (TRUE|FALSE)/}

  ROUTE_DEF = [:operation,:type,:origin,:destination,
               :cost_pp,:ticket_px,:min_takeoff]
  AIRCRAFT_DEF =[:operation,:type,:name,:number_of_seats]
  GENERAL_AIRLINE_DEF = [:operation,:type,:name,:age]
  LOYALTY_DEF = [:operation,:type,:name,:age,:points,:use_points,:extra_luggage]
         

  attr_reader :input_file,:output_file,:flight,:extract           

  include File_helper

  def initalize
    @extract = {}
  end

  def add_flight(flight)
    @flight << flight
  end

  def read_inputs
    puts "Input file with data:"
    @input_file = gets.chomp
    puts "Input destination file:"
    @output_file = gets.chomp
  end

  def extract_route
    raise "wrong number of routes" if @extract[:route].length != 1
    dict = {}
    for field in 2...@extract[:route][0].length     
      dict[ROUTE_DEF[field]] = extract[:route][0][field]
    end
    route = Route.new(dict)
    @flight.add_route(route)
  end

  def extract_aircraft
    raise "wrong number of aircrafts" if extract[:aircraft].length != 1
    dict = {}
    for field in 2...@extract[:aircraft][0].length     
      dict[AIRCRAFT_DEF[field]] = extract[:aircraft][0][field]
    end
    plane = Aircraft.new(dict)
    @flight.add_aircraft(plane)
  end

  def extract_general_passanger
    len = @extract[:general_passanger].length
    for i in 0...len
      dict={}
      for j in 2...@extract[:general_passanger][i].length
        dict[GENERAL_AIRLINE_DEF[j]] = @extract[:general_passanger][i][j]
      end  
      passanger = General_passanger.new(dict)
      @flight.add_passanger(passanger)
    end
  end

  def extract_airline_passanger
    len = @extract[:airline_passanger].length
    for i in 0...len
      dict={}
      for j in 2...@extract[:airline_passanger][i].length
        dict[GENERAL_AIRLINE_DEF[j]] = @extract[:airline_passanger][i][j]
      end  
      passanger = Airline_passanger.new(dict)
      @flight.add_passanger(passanger)
    end
  end

  def extract_loyalty_passanger
    len = @extract[:loyalty_passanger].length
    for i in 0...len
      dict={}
      for j in 2...@extract[:loyalty_passanger][i].length
        dict[LOYALTY_DEF[j]] = @extract[:loyalty_passanger][i][j]
      end 
      passanger = Loyalty_passanger.new(dict)
      @flight.add_passanger(passanger)
    end
  end

  #just a helper for test of report_spec
  def set_files(input = "./sample1.txt",output = './dest1.txt')
    @input_file = input
    @output_file = output
    @extract = load_file(@input_file,PATTERNS)
    @flight = Flight.new
  end

  def extract_data
    @flight = Flight.new
    read_inputs
    @extract = load_file(input_file,PATTERNS)
    extract_route
    extract_aircraft
    extract_general_passanger if @extract[:general_passanger]
    extract_airline_passanger if @extract[:airline_passanger]     
    extract_loyalty_passanger if @extract[:loyalty_passanger]
  end

  def prepare_report
    total_pass = @flight.passangers.count
    number_general =  @flight.count_passangers_type(:general_passanger)
    number_airline =  @flight.count_passangers_type(:airline_passanger)
    number_loyalty = @flight.count_passangers_type(:loyalty_passanger)
    bags = @flight.number_of_bags
    total_cost = @flight.total_cost
    total_unadjusted_rev = @flight.total_unadjusted_revenue
    total_adjusted_rev = @flight.total_adjusted_revenue
    redeemed_points = @flight.redeemed_points
    can_fly = @flight.take_off_allowed?
    [total_pass,number_general,number_airline,number_loyalty,
     bags,redeemed_points,total_cost,total_unadjusted_rev,
     total_adjusted_rev,can_fly]
  end

end