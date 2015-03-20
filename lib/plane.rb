class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = false
  end

  def land_to airport
    @flying = false
    airport.land(self)
  end

  def take_off_from airport
    @flying = true
    airport.take_off(self)
  end
end
