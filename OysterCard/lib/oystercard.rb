class OysterCard
  attr_reader :balance, :journeys, :entry_station, :exit_station
  CARD_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize(limit=CARD_LIMIT)
    @balance = 0
    @journeys = []
    @limit = limit
    @entry_station = nil
    @exit_station = nil
  end

  def top_up(money)
    fail "Maximum balance exceeded" if @balance + money > CARD_LIMIT

    @balance += money
  end

  def touch_in(station)
    fail "Need Minimum of £1" if @balance < MINIMUM_AMOUNT

    @entry_station = station
  end

  def touch_out(given_station)
    deduct(MINIMUM_AMOUNT)
    @exit_station = given_station
    @journeys << [{@entry_station, @exit_station}]
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(money)
    @balance -= money
  end
end
