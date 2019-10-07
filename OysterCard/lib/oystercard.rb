class OysterCard
  attr_reader :balance
  CARD_LIMIT = 90
  MINIMUM_AMOUNT = 1
  def initialize(limit=CARD_LIMIT)
    @balance = 0
    @limit = limit
    @journeyStatus = false
  end

  def top_up(money)
    fail "Maximum balance exceeded" if @balance + money > CARD_LIMIT

    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    fail "Need Minimum of £1" if @balance < MINIMUM_AMOUNT
    @journeyStatus = true
  end

  def touch_out
    @journeyStatus = false
  end

  def in_journey?
    @journeyStatus
  end
end
