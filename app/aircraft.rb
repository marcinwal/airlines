class Aircraft
  attr_reader :name,:number_of_seats,:seats_available

  def initialize(name:type_of_plane,number_of_seats:seats=100)
    @name = name;
    @number_of_seats = number_of_seats.to_f
    @seats_available = number_of_seats
  end

  #additional methods not necessary for this task
  def add_passanger
    @seats_available -= 1 unless full?
  end

  def full?
    number_of_seats == seats_available
  end
end