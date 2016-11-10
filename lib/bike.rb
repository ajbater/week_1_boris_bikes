require './lib/docking_station_class.rb'

class Bike

  attr_reader :working

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def broken
    @working = false
  end

end
