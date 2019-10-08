class Station do
  attr_reader :name, :zone
  DEFAULT_ZONE = 1
  def initialize(name, zone=DEFAULT_ZONE)
    @name = name
    @zone = zone
  end
end
