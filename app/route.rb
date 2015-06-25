class Route

  attr_reader :origin,:destination,:cost_pp,:ticket_px,
              :min_takeoff

  def initialize(origin: city1,destination: city2,cost_pp: cost1,
                 ticket_px: px,min_takeoff: min_pct)
      @origin,@destination = origin,destination
      @cost_pp,@ticket_px = cost_pp,ticket_px
      @min_takeoff = min_takeoff
  end

  def calc_total_cost(how_many:persons)
    @cost_pp * how_many
  end

  def take_off_allowed?(occupied,capacity)
    ratio = occupied/capacity
    ratio >= min_takeoff && ratio <= 100
  end


end