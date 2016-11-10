require './lib/bike.rb'

class DockingStation

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    raise "No bikes available" if @bikes.empty?
    @bikes[0]
  end

  def dock(bike)
    raise "Docking station full" if @bikes.count >= 20
    @bikes << bike
  end

  def full?
    @bikes.count >= 20
  end

end
