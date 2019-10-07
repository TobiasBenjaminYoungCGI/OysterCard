class OysterCard
  attr_reader :balance
  CARD_LIMIT = 90

  def initialize(limit=CARD_LIMIT)
    @balance = 0
    @limit = limit
  end

  def top_up(money)
    p @balance
    fail "Maximum balance exceeded" if @balance + money > CARD_LIMIT
    p @balance
    @balance += money
  end

end
