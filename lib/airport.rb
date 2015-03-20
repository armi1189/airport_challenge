class Airport
  attr_reader :planes, :available_room

  DEFAULT_CAPACITY = 30

  def initialize(options = {})
    @planes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @available_room = @capacity
  end

  def land plane
    if full?
      fail 'Airport is Full'
    elsif planes.include?(plane)
      fail 'Plane is in the airport'
    else
      @available_room -= 1
      planes << plane
    end
  end

  def take_off plane
    fail "Plane isn't in airport" unless planes.include?(plane)
    @available_room += 1
    planes.delete(plane)
  end

  private

  def planes_count
    planes.length
  end

  def full?
    planes.length >= @capacity
  end
end
