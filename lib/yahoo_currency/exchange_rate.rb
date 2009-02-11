class ExchangeRate

  attr_accessor :from, :to, :rate, :timestamp
  
  def initialize(from, to, rate, timestamp)
    @from = from
    @to = to
    @rate = rate
    @timestamp = timestamp
  end
  
end
