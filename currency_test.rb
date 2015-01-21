require 'minitest/autorun'
require 'minitest/pride'
require './currency_class.rb'

class CurrencyTest < Minitest::Test

  def test_00_currency_class_exists
    assert Currency
  end

  def test_01_currency_has_known_amount
    currency = Currency.new(100.00, "AUD")
    assert_equal 100.00, currency.amount
  end

  def test_2_currency_class_has_currency_code
    currency = Currency.new(100.00, "AUD")
    assert_equal "AUD", currency.code
  end

  def test_3_currency_can_be_equal_to_another_currency_object
    nicole = Currency.new(100.00, "AUD")
    keith = Currency.new(100.00, "AUD")
    tom = Currency.new(100.00, "USD")
    assert_equal true, nicole == keith
    refute nicole == tom
  end

  def test_04_like_currency_can_be_added
    nicole = Currency.new(100.00, "AUD")
    keith = Currency.new(100.00, "AUD")
    tom = Currency.new(100.00, "USD")
    assert nicole + keith
    refute nicole == tom
  end

  def test_05_like_currency_can_be_subtracted
    nicole = Currency.new(100.00, "AUD")
    keith = Currency.new(100.00, "AUD")
    tom = Currency.new(100.00, "USD")
    assert nicole + keith
    refute nicole == tom
  end

  def test_06_currencies_must_match
    nicole = Currency.new(100.00, "AUD")
    keith = Currency.new(100.00, "AUD")
    tom = Currency.new(100.00, "USD")
    assert nicole + keith
    refute nicole == tom
  end

  def test_07_currencies_can_multiply
    nicole = Currency.new(100.00, "AUD")
    keith = Currency.new(100.00, "AUD")
    tom = Currency.new(100.00, "USD")
    assert nicole + keith
    refute nicole == tom
  end
end
