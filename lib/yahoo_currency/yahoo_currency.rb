require 'net/http'
require 'time'

class YahooCurrency

  # set the host and path we access the service from
  HOST = 'download.finance.yahoo.com'
  PATH = '/d/quotes.csv'

  #
  # Retrieve the exchange rate for the from and to currency codes.
  #
  def self.get_rate!(from, to)

    # create the url
    http = Net::HTTP.new(HOST, 80)
    target = "#{PATH}?s=#{from}#{to}=X&f=nl1d1t1"

    # hit the url
    resp, data = http.get(target)
    # ruby >= 2.0 compatibility
    data = resp.body if RUBY_VERSION > "1.9"

    # check the response code
    if resp.code.to_i != 200
      raise "#{resp.code} #{resp.message}"
    end

    ExchangeRate.new(from, to, parse_rate(data), parse_timestamp(data))
  end

  private

  #
  # The rate is the first field in the CSV
  #
  def self.parse_rate(data)
    data.split(',')[1].to_f
  end

  #
  # The timestamp is in the 2 and 3rd fields of the CSV
  #
  # The timestamp in the data from Yahoo will in the format
  # "M/D/YYYY HH:mm:ampm" Eg. 6/18/2008 2:45am
  #
  def self.parse_timestamp(data)
    data = data.gsub('"', '')
    d = data.chop.split(',')[2]
    t = data.split(',')[3].gsub('"', '')

    return nil if d == "N/A"

    dp = d.split("/")

    Time.parse("#{dp[2].to_i}/#{dp[0]}/#{dp[1].to_i} #{t}".chop)
  end

end
