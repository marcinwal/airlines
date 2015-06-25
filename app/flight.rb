require 'byebug'
class Flight

  attr_reader :route,:passangers,:aircraft

  def initialize
    @route = []
    @passangers = []
    @aircraft = []
  end

  def count_passangers
    @passangers.size
  end

  def add_passanger(passanger)
    @passangers << passanger
  end

  def add_aircraft(aircraft)
    @aircraft << aircraft
  end

end