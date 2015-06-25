class General_passanger

  attr_reader :name,:age,:luggage
  def initialize(name:name,age:age,luggage:lggage=1)
    @name = name
    @age = age
    @luggage = luggage
  end

  def calc_final_price(initial:price)
    initial
  end
end