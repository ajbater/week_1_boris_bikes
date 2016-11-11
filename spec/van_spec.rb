require 'van.rb'
require 'bike.rb'
require 'docking_station_class.rb'




describe Van do

  let(:bike) { double :bike}
  let(:broken_bike) { double :broken_bike}
  let(:station) { double :station}


  it 'collects a broken bike' do
    station = DockingStation.new
    bike = Bike.new
    bike.broken
    station.dock(bike)
    expect(subject.collect(station)).to eq [bike]
  end








  def allow_true
    allow(:bike).to receive(:working?).and_return(true)
  end

  def allow_false
    allow(:broken_bike).to receive(:working?).and_return(false)
  end

  def allow_station
    allow(:station).to receive(:dock).and_return(broken_bike)
  end

end
