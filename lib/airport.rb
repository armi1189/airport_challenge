class Airport
  attr_reader :planes, :available_room

  DEFAULT_CAPACITY = 30

  def initialize(options = {})
    @planes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @available_room = @capacity
  end

  def land plane
    fail 'Airport is Full' if full?
    @available_room -= 1
    planes << plane
  end

  def take_off plane
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
