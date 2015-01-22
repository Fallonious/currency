require 'minitest/autorun'
require 'minitest/pride'
require './currency_class.rb'
require './currency_converter.rb'

class CurrencyTest < Minitest::Test

  def test_00_currency_class_exists
    assert Currency
  end

  def test_01_currency_has_known_amount
    currency = Currency.new(100.00, "AUD")
    assert_equal 100.00, currency.amount
  end

  def test_02_currency_class_has_currency_code
    currency = Currency.new(100.00, "AUD")
    assert_equal "AUD", currency.code
  end

  def test_03_currency_can_be_equal_to_another_currency_object
    nicole = Currency.new(100.00, "AUD")
    keith = Currency.new(100.00, "AUD")
    bob = Currency.new(111.00, "AUD")
    tom = Currency.new(100.00, "USD")
    assert nicole == keith
    refute bob == keith
    refute nicole == tom
  end

  def test_04_like_currency_can_be_added
    nicole = Currency.new(100.00, "AUD")
    keith = Currency.new(100.00, "AUD")
    assert nicole + keith == Currency.new(200.00, "AUD")
  end

  def test_05_like_currency_can_be_subtracted
    nicole = Currency.new(100.00, "AUD")
    keith = Currency.new(100.00, "AUD")
    assert (nicole - keith) == Currency.new(0.00, "AUD")
  end

  def test_06_currency_codes_must_match
    nicole = Currency.new(400.00, "AUS")
    tom = Currency.new(200.00, "USD")
    assert_raises(DifferentCurrencyCodeError) do
      nicole + tom
    end
    assert_raises(DifferentCurrencyCodeError) do
      nicole - tom
    end
  end

  def test_07_currencies_can_multiply
    nicole = Currency.new(100, "AUD")
    assert nicole * 2 == Currency.new(200.00, "AUD")
    assert nicole * 2.5 == Currency.new(250.00, "AUD")
  end

  def test_08_currency_converter_exist
    assert CurrencyConverter
  end

 def test_09_hash_of_conversion_rates_exists
   rates = {USD: 1.0, AUD: 1.24}
   calculator = CurrencyConverter.new(rates)
   assert_equal calculator.conversion_rates, rates
 end

  def test_10_currency_is_equal
    rates = {USD: 1.0, AUD: 1.24}
    money_bag = CurrencyConverter.new(rates)
    assert money_bag.convert(Currency.new(1, :USD),:USD) == Currency.new(1,:USD)
  end

  def test_11_change_currencies
    rates = {USD: 1.0, AUD: 1.24}
    money_bag = CurrencyConverter.new(rates)
    #bank_account = Currency.new(rates)
    assert money_bag.convert(Currency.new(1, :USD), :AUD) == Currency.new(1.24, :AUD)
    #assert money_bag.convert(Currency.new(1, :USD)) == ([USD: 25].*@conversion_rates[:AUD])
 end
end
