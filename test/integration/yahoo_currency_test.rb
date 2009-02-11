require 'test/test_helper'

class YahooCurrencyTest < Test::Unit::TestCase
  
  def setup
    @timestamp = Time.parse("6/18/2008 2:45am")
  end

  def test_get_rate_usd_aud
    exchange_rate = YahooCurrency.get_rate!("AUD", "USD")
    assert_equal "AUD", exchange_rate.from
    assert_equal "USD", exchange_rate.to
    assert_not_nil exchange_rate.rate
    assert_not_nil exchange_rate.timestamp
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
