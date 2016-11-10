require './lib/bike.rb'

class DockingStation

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    raise "No bikes available" if empty?
    @bikes[0]
  end

  def dock(bike)
    raise "Docking station full" if full?
    @bikes << bike
  end

  def check_full?
    full?
  end

  def check_empty?
    empty?
  end

private
  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end

end
