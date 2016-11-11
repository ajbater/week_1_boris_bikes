require_relative './bike.rb'
require_relative './docking_station_class.rb'

class Van

  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def collect(station)
    @broken_bikes = station.release_broken_bike
    @broken_bikes
  end

  # def clear_bikes
  #   @broken_bikes
  # end



end
