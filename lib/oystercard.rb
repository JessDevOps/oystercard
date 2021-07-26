class Oystercard
DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90

attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  # def balance
  #   balance = 0
  # end

  def top_up(numb)
    @balance += numb
    fail 'has exceeded max balance' if @balance > MAXIMUM_BALANCE 
  end

  def deduct(fare)
    @balance = @balance - fare
  end
end
