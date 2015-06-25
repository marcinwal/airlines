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

  def total_cost
    @route[0].calc_cost(how_many:@passangers.length)
  end

  def total_unadjusted_revenue
    @route[0].calc_unadjusted_revenue(how_many:@passangers.length)
  end

  def total_adjusted_revenue
    @passangers.reduce(0){|sum,pass| sum+pass.calc_final_price(:initial=>route[0].ticket_px)}
  end
  
  #other way to calculate is:
  #redeemed = initial - airline(airline*ticket_px)-final
  def redeemed_points
     @passangers.reduce(0){|redeemed,pass| pass.status == :loyalty_passanger ? 
                            redeemed + pass.redeemed : redeemed }
  end

  def take_off_allowed?
    @route[0].take_off_allowed?(passangers.length,
                             aircraft[0].number_of_seats)
  end

  def full?
    !(@aircraft[0].number_of_seats > passangers.length )
  end

end