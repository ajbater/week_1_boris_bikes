require_relative './bike.rb'
require_relative './docking_station_class.rb'

class Van

  def initialize
    @broken_bikes = []
  end

  def collect(station)
    @broken_bikes << station.release_broken_bike
    @broken_bikes
  end

  



end
