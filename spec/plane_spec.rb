require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

describe Plane do

  context 'when created' do
    it { is_expected.not_to be_flying }
    it 'can land' do
      expect(subject).to respond_to :land_to
    end
    it 'can take off' do
      expect(subject).to respond_to :take_off_from
    end
  end

  context 'after take off' do
    it 'is expected to by flying' do
      airport = double :airport, planes: [subject]
      expect(airport).to receive(:take_off).and_return([subject])
      subject.take_off_from(airport)
      expect(subject).to be_flying
    end
  end

  context 'after landed' do
    it 'is expected not to be flying' do
      airport = double :airport, planes: [subject]
      expect(airport).to receive(:take_off).and_return([subject])
      expect(airport).to receive(:land).and_return([subject])
      subject.take_off_from(airport)
      subject.land_to(airport)
      expect(subject).not_to be_flying
    end
  end
end
