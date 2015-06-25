class General_passanger

  attr_reader :name,:age,:luggage,:discount

  def initialize(name:name,age:age,luggage:lggage=1)
    @name = name
    @age = age
    @luggage = luggage
    @discount = 0.0
  end
end