require 'airport'

describe Airport do

  context 'taking off and landing' do

    it 'a plane can land' do
      subject.land(:plane)
      expect(subject.planes).to eq([:plane])
    end
    it 'a plane cannot land twice' do
      subject.land(:plane)
      expect { subject.land :plane }.to raise_error 'Plane is in the airport'
    end
    it 'a plane can take off' do
      subject.land(:plane)
      subject.take_off(:plane)
      expect(subject.planes).to eq([])
    end
    it 'a plane cannot take off twice' do
      subject.land(:plane)
      subject.take_off(:plane)
      expect { subject.take_off :plane }.to raise_error "Plane isn't in airport"
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      (1..30).each { |x| subject.land x }
      expect { subject.land :plane }.to raise_error 'Airport is Full'
    end

    it 'can calculate available room after landing' do
      (1..15).each { |x| subject.land x }
      expect(subject.available_room).to eq 15
    end

    it 'can calculate available room after take off' do
      (1..20).each { |x| subject.land x }
      (1..7).each { |x| subject.take_off x }
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
