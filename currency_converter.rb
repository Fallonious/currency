# 1 USD == 1.23614 AUD
# 1 USD == 0.86270 EUR
# 1 USD == 1.23532 CAD
require './currency_class.rb'

class CurrencyConverter
  attr_reader :conversion_rates

  def initialize(conversion_rates)
    @conversion_rates = conversion_rates
  end

  def convert(original_currency, new_currency_code)
    if conversion_rates.include?(new_currency_code) && conversion_rates.include?(original_currency.code)
      new_amount = (original_currency.amount*@conversion_rates[new_currency_code])/@conversion_rates[original_currency.code]
      return Currency.new(new_amount, new_currency_code)
    else
      raise UnknownCurrencyCodeError
    end
  end

  # def exchange(original_currency, new_currency_code)
  #   new_amount = (original_currency.amount*@conversion_rates[:AUS])/@conversion_rates[:USD]
  #   return Currency.new(new_amount, new_currency_code)
  # end
end
