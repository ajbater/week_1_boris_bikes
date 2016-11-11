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
    expect(subject.release_bike.working).to eq true
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
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
    bike = Bike.new
    expect { subject.dock(bike) }.to raise_error(RuntimeError, "Docking station full")
  end

  describe '.check_full?' do
    it 'returns true if the docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect(subject.check_full?).to eq true
    end

    it 'returns false if the docking station is not full' do
      expect(subject.check_full?).to eq false
    end
  end

  describe '.check_empty?' do
    it 'returns true if the docking station is empty' do
      expect(subject.check_empty?).to eq true
    end

    it 'returns false if the docking station is not empty' do
      subject.dock(Bike.new)
      expect(subject.check_empty?).to eq false
    end
  end

  it 'checks that DEFAULT_CAPACITY has been set and is an integer' do
    expect(DockingStation::DEFAULT_CAPACITY).to be_kind_of(Integer)
  end

  it 'allows the user to set capacity when a new DockingStation is instantiated' do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

  it 'checks that capacity equals DEFAULT_CAPACITY when no default value is set' do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'will not release a broken bike' do
    bike1 = Bike.new
    bike2 = Bike.new
    bike3 = Bike.new
    bike1.broken
    bike3.broken
    subject.dock(bike1)
    subject.dock(bike2)
    subject.dock(bike3)
    subject.release_bike
    expect{ subject.release_bike }.to raise_error(RuntimeError, 'No bikes available')
  end

end
