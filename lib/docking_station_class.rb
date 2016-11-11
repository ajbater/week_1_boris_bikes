require './lib/bike.rb'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  attr_reader :bikes, :capacity

  def release_bike
    raise "No bikes available" if empty_working?
    working_bike = @bikes.select { |bike| bike.working? }.pop
    @bikes.delete(working_bike)
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

  def release_broken_bike
    # raise "No bikes available" if empty_working?
    broken_bike = @bikes.reject { |bike| bike.working? }
    @bikes.delete(broken_bike)
    broken_bike
  end


private
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    #@bikes.select { |bike| bike.working? }.empty?
    @bikes.count == 0
  end

  def empty_working?
    @bikes.select { |bike| bike.working? }.count == 0
  end

end
