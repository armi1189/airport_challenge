require 'airport'

describe Airport do

  context 'taking off and parking' do

    it 'a plane can park' do
      subject.park(:plane)
      expect(subject.planes).to eq([:plane])
    end
    it 'a plane cannot be parked twice' do
      subject.park(:plane)
      expect { subject.park :plane }.to raise_error 'Plane is in the airport'
    end
    it 'a plane can unpark' do
      subject.park(:plane)
      subject.unpark(:plane)
      expect(subject.planes).to eq([])
    end
    it 'a plane cannot unpark twice' do
      subject.park(:plane)
      subject.unpark(:plane)
      expect { subject.unpark :plane }.to raise_error "Plane isn't in airport"
    end
  end

  context 'traffic control' do

    it 'a plane cannot park if the airport is full' do
      (1..30).each { |x| subject.park x }
      expect { subject.park :plane }.to raise_error 'Airport is Full'
    end

    it 'can calculate available room after parking' do
      (1..15).each { |x| subject.park x }
      expect(subject.available_room).to eq 15
    end

    it 'can calculate available room after unparking' do
      (1..20).each { |x| subject.park x }
      (1..7).each { |x| subject.unpark x }
      expect(subject.available_room).to eq 17
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do

      xit 'a plane cannot take off when there is a storm brewing'
      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
