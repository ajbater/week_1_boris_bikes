require './lib/bike.rb'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  attr_reader :bikes, :capacity

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
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
