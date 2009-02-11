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
    resp, data = http.get(target, nil)

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
  def self.parse_timestamp(data)
    # the timestamp will be in M/D/YYYY HH:mm:ampm format
    ts = (data.split(',')[2] + ' ' + data.split(',')[3]).gsub('"', '').chop
    return nil if ts == "N/A N/A"

    Time.parse(ts)
  end

end
