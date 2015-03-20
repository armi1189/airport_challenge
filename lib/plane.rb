class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = false
  end

  def land_to airport
    fail 'Plane is not flying' if flying? == false
    airport.park(self)
    @flying = false
    "#{self} has landed in #{airport}"
  end

  def take_off_from airport
    fail 'Plane is flying' if flying?
    airport.unpark(self)
    @flying = true
    "#{self} took off from #{airport}"
  end

  def travel_from_to from, to
    take_off_from(from)
    land_to(to)
    "#{self} travelled from #{from} to #{to}"
  end
end
