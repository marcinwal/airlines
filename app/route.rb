class Route

  attr_reader :origin,:destination,:cost_pp,:ticket_px,
              :min_takeoff

  def initialize(origin: city1,destination: city2,cost_pp: cost1,
                 ticket_px: px,min_takeoff: min_pct)
      @origin,@destination = origin,destination
      @cost_pp,@ticket_px = cost_pp.to_f,ticket_px.to_f
      @min_takeoff = min_takeoff.to_f
  end

  def calc_cost(how_many:persons)
    @cost_pp * how_many
  end

  def calc_unadjusted_revenue(how_many:persons)
    @ticket_px * how_many
  end

  def take_off_allowed?(occupied,capacity)
    ratio = (occupied * 1.0/ capacity) * 100.0
    ratio >= min_takeoff && ratio <= 100.0
  end


end