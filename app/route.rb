class Route

  attr_reader :origin,:destination,:cost_pp,:ticket_px,
              :min_takeoff

  def initialize(origin: city1,destination: city2,cost_pp: cost1,
                 ticket_px: px,min_takeoff: min_pct)
      @origin,@destination = origin,destination
      @cost_pp,@ticket_px = cost_pp,ticket_px
      @min_takeoff = min_takeoff
  end

end