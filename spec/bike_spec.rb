require 'bike'

describe Bike do
  it {is_expected.to respond_to :working}

  describe '.working' do

    it 'should show if a bike works' do
      expect(subject.working).to eq true
    end

    it 'should show if a bike does not work' do
      subject.broken
      expect(subject.working?).to eq false
    end

  end

end
