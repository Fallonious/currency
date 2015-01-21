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
    new_amount = (original_currency.amount*@conversion_rates[new_currency_code])/@conversion_rates[original_currency.code]
    return Currency.new(new_amount, new_currency_code)

  end
end


  # def initialze(currency_code1, currency_code2)
  #   @currency_codes = []
  #
  # end
  #
  #  def currency_codes = [USD: 1.0, EUR: ]
  # def print_a_currency(currency_object)
  #   puts currency_object.code
  #   puts currency_object.amount
  # end




#
# usd_to_cad = CurrencyConverter.new
#
#
# usd_to_aus = CurrencyConverter.new
#

#cc = CurrencyConverter.new
# amount = 200.00
# currency_code = "AUD"
# bag_of_money = Currency.new(amount, currency_code)
#
# cc.print_a_currency(bag_of_money)
