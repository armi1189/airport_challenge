require 'capybara/rspec'
require 'airport'
require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  scenario 'planes can land and all planes can take off' do
    airport = Airport.new
    plane = Plane.new
    airport.park(plane)
    plane.take_off_from(airport)
    plane.land_to(airport)
    expect(airport.planes).to eq([plane])
    expect(plane).not_to be_flying
  end
  scenario 'planes can take off from an airport and land in a different one' do
    airport = Airport.new
    another_airport = Airport.new
    plane = Plane.new
    airport.park(plane)
    plane.take_off_from(airport)
    plane.land_to(another_airport)
    expect(airport.planes).to eq([])
    expect(another_airport.planes).to eq([plane])
  end
end
