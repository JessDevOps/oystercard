class Oystercard
DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 3
attr_reader :balance , :journeys , :entry_station , :exit_station , :station , :journey
  def initialize(balance = DEFAULT_BALANCE, journeys = Array.new)
    @balance = balance
    @journeys = journeys
    @station = station
    @entry_station = entry_station
    @exit_station = exit_station
    # @journey = {entry_station: entry_station, exit_station: exit_station}
  end

  # def balance
  #   balance = 0
  # end

  def top_up(numb)
    @balance += numb
    fail 'has exceeded max balance' if @balance > MAXIMUM_BALANCE 
  end

  # def deduct(fare)
  #   @balance -= fare
  # end

  def touch_in(station)
    @entry_station = station
    fail 'insufficient funds on card' if @balance < 1
    @journey = true
    
  end

  def touch_out(station)
    @exit_station = station
    self.deduct(MINIMUM_FARE)
    @entry_station = nil
    @journeys.push({:entry_station => @entry_station, exit_station => @exit_station})
  end

  def in_journey?
    !!entry_station
  end

  private
  def deduct(fare)
    @balance -= fare
  end
end
