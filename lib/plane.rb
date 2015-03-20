class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = false
  end

  def land_to airport
    fail 'Plane is not flying' if flying? == false
    @flying = false
    airport.land(self)
  end

  def take_off_from airport
    fail 'Plane is flying' if flying?
    @flying = true
    airport.take_off(self)
  end
end
