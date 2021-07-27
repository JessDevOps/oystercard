class Oystercard
DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90

attr_reader :balance , :journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey = journey
  end

  # def balance
  #   balance = 0
  # end

  def top_up(numb)
    @balance += numb
    fail 'has exceeded max balance' if @balance > MAXIMUM_BALANCE 
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    fail 'insufficient funds on card' if @balance < 1
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    return journey ? true : false
  end

end
