class Airport
  attr_reader :planes, :available_room

  DEFAULT_CAPACITY = 30

  def initialize(options = {})
    @planes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @available_room = @capacity
  end

  def park plane
    fail 'Airport is Full' if full?
    fail 'Plane is in the airport' if planes.include?(plane)
    @available_room -= 1
    planes << plane
    "#{plane} has been parked in #{self}"
  end

  def unpark plane
    fail "Plane isn't in airport" unless planes.include?(plane)
    @available_room += 1
    planes.delete(plane)
    "#{plane} has been unparked in #{self}"
  end

  private

  def planes_count
    planes.length
  end

  def full?
    planes.length >= @capacity
  end
end
