require 'van'
require 'garage'
require 'docking_station_class'
require 'bike'

describe Garage do

  it 'accepts broken bikes' do
    bike = Bike.new
    station = DockingStation.new
    van = Van.new
    bike.broken
    station.dock(bike)
    van.collect(station)
    expect(subject.receive(van)).to eq [bike]
  end

  it 'fixes bikes' do
    bike = Bike.new
    station = DockingStation.new
    van = Van.new
    bike.broken
    station.dock(bike)
    van.collect(station)
    subject.receive(van)
    expect(subject.fix).to eq bike
  end



end
