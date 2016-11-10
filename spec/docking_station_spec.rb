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

  it {is_expected.to respond_to(:bikes)}

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to include(bike)
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
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

  it 'can accept more than one bike' do
    bike1 = Bike.new
    bike2 = Bike.new
    subject.dock(bike1)
    subject.dock(bike2)
    expect(subject.bikes).to include(bike1, bike2)
  end

  it 'raises error if the docking station is full' do
    20.times {subject.dock(Bike.new)}
    bike = Bike.new
    expect { subject.dock(bike) }.to raise_error(RuntimeError, "Docking station full")
  end

  describe '.full?' do
    it 'returns true if the docking station is full' do
      20.times {subject.dock(Bike.new)}
      expect(subject.full?).to eq true
    end
  end

end
