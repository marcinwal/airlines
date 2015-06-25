require_relative 'general_passanger'

class Loyalty_passanger < General_passanger
  attr_reader :points,:use_points,:extra_luggage

  def initialize(name:name,age:age,points:points,
                 use_points:use_points,extra_luggage:extra_luggage)
    super(name:name,age:age)
    @points = points
    @use_points = use_points
    @extra_luggage = extra_luggage
  end

  def luggage
    @extra_luggage? 2 : 1
  end

  def calc_final_price(initial:price)
    return initial unless use_points
    final_price = [0,initial - points].max
    @points -= initial - final_price
    final_price
  end  

end