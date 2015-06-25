require_relative 'general_passanger'

class Airline_passanger < General_passanger


  def initialize(name:name,age:age,luggage:lggage=1)
    super
    @status = :airline_passanger
  end

  def calc_final_price(initial:price)
    0.0
  end
end