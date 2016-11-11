require_relative './van.rb'

class Garage

  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def receive(van)
    @broken_bikes = van.broken_bikes
    @broken_bikes
  end

  def fix
    
  end


end
