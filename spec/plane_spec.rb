require 'plane'

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
      expect(airport).to receive(:unpark).and_return([subject])
      subject.take_off_from(airport)
      expect(subject).to be_flying
    end
    it 'cannot take off again' do
      airport = double :airport
      expect(airport).to receive(:unpark).and_return([subject])
      subject.take_off_from(airport)
      expect { subject.take_off_from(airport) }.to raise_error 'Plane is flying'
    end
  end

  context 'after landed' do
    it 'is expected not to be flying' do
      airport = double :airport, planes: [subject]
      expect(airport).to receive(:unpark).and_return([subject])
      expect(airport).to receive(:park).and_return([subject])
      subject.take_off_from(airport)
      subject.land_to(airport)
      expect(subject).not_to be_flying
    end
    it 'cannot land again' do
      airport = double :airport, planes: [subject]
      expect(airport).to receive(:unpark).and_return([subject])
      expect(airport).to receive(:park).and_return([subject])
      subject.take_off_from(airport)
      subject.land_to(airport)
      expect { subject.land_to(airport) }.to raise_error 'Plane is not flying'
    end
  end
end
