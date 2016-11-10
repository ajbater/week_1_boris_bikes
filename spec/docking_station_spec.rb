require 'docking_station_class'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'expects DockingStation to release a new instance of Bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it 'expects DockingStation to release a bike that works' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike.working?).to eq true
  end

  it { is_expected.to respond_to :dock }

  it {is_expected.to respond_to(:bike)}

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it 'raises error if no bikes' do
    expect { subject.release_bike }.to raise_error(RuntimeError, "No bikes available")
  end

end
