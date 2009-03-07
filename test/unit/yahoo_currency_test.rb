require 'test/test_helper'
require 'test/mocks/yahoo_currency_mock'

class YahooCurrencyTest < Test::Unit::TestCase
  
  def setup
    @timestamp = Time.parse("2008-06-18 02:45:00 +0800")
  end

  def test_get_rate_jpy_usd
    exchange_rate = YahooCurrency.get_rate!("JPY", "USD")
    assert_equal "JPY", exchange_rate.from
    assert_equal "USD", exchange_rate.to
    assert_equal 0.0093, exchange_rate.rate
    assert_equal @timestamp, exchange_rate.timestamp
  end
  
  def test_get_rate_usd_cad
    exchange_rate = YahooCurrency.get_rate!("USD", "CAD")
    assert_equal "USD", exchange_rate.from
    assert_equal "CAD", exchange_rate.to
    assert_equal 1.0191, exchange_rate.rate
    assert_equal @timestamp, exchange_rate.timestamp
  end
  
  #
  # Test one or more unknown currency codes
  #
  def test_get_rate_fake_fake
    exchange_rate = YahooCurrency.get_rate!("FAKE", "FAKE")
    assert_equal "FAKE", exchange_rate.from
    assert_equal "FAKE", exchange_rate.to
    assert_equal 0.00, exchange_rate.rate
    assert_nil exchange_rate.timestamp
  end
  
end
