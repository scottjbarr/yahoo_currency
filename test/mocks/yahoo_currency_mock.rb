#
# A mock of the YahooCurrency class
#
require  'lib/yahoo_currency'

# Reopen and override the class
class YahooCurrency

  def self.get_rate!(from, to)
    
    data = ""
    # try and open a test csv files
    File.open("test/docs/#{from}-#{to}.csv", "r") do |infile|
      data = infile.gets
    end

    ExchangeRate.new(from, to, parse_rate(data), parse_timestamp(data))
  end
  
end
