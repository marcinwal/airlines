require 'byebug'
class Flight

  attr_reader :route,:passangers,:aircraft

  def initialize
    @route = []
    @passangers = []
    @aircraft = []
  end

  def add_passanger(passanger)
    @passangers << passanger
  end

  def add_aircraft(aircraft)
    @aircraft << aircraft
  end

  def add_route(route)
    @route <<  route 
  end

  def count_passangers_type(type)
    @passangers.reduce(0){|sum,pass| pass.status == type ? sum + 1: sum }
  end

  def number_of_bags
    @passangers.reduce(0){|bags,pass| bags+pass.luggage}
  end

end