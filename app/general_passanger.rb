class General_passanger

  attr_reader :name,:age,:luggage,:status
  def initialize(name:name,age:age,luggage:lggage=1)
    @name = name
    @age = age.to_f
    @luggage = luggage
    @status = :general_passanger
  end

  def calc_final_price(initial:price)
    initial
  end
end