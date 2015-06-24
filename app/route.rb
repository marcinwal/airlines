class Route

  attr_reader :origin,:destination,:cost_pp,:ticket_px,
              :min_takeoff

  @@ADD_ROUTE_PATTERN = /add route \D+ \D+ \d+ \d+ \d+/

  def initialize(origin: city1,destination: city2,cost_pp: cost1,
                 ticket_px: px,min_takeoff: min_pct)
      @origin,@destination = origin,destination
      @cost_pp,@ticket_px = cost_pp,ticket_px
      @min_takeoff = min_takeoff
  end

  def self.ADD_ROUTE_PATTERN
    @@ADD_ROUTE_PATTERN
  end
end