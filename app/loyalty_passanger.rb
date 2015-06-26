require_relative 'general_passanger'

class Loyalty_passanger < General_passanger
  attr_reader :points,:use_points,:extra_luggage,:redeemed

  def initialize(name:name,age:age,points:points,
                 use_points:use_points,extra_luggage:extra_luggage)
    super(name:name,age:age)
    @points = points.to_f
    @use_points = use_points
    @extra_luggage = extra_luggage
    @status = :loyalty_passanger
  end

  def luggage
    @extra_luggage? 2 : 1
  end

  #I added point dedutcion and that is why  added redeemed as 
  #last redeeemed points
  def calc_final_price(initial:price)
    return initial unless use_points
    final_price = [0,initial - @points].max
    @redeemed = initial - final_price
    @points -= @redeemed
    final_price
  end  

end