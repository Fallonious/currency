class DifferentCurrencyCodeError < StandardError
end

class Currency
  # attr_reader :amount

  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end

  def amount
    @amount
  end

  def code
    return @currency_code
  end

  def ==(other)
    self.amount == other.amount && self.code == other.code
  end

  def +(other)
    if self.code == other.code
      return Currency.new(self.amount.+(other.amount), @currency_code)
    else
      raise DifferentCurrencyCodeError, "You can't work with two different currency codes"
    end
  end

  def -(other)
    if self.code == other.code
      return Currency.new(self.amount-(other.amount), @currency_code)
    else
      raise DifferentCurrencyCodeError, "You can't work with two different currency codes"
    end
  end

  def *(factor)
    Currency.new(@amount * factor, @currency_code)
  end

end



 # nicole = Currency.new(100.00, "AUD")
 # keith = Currency.new(100.00, "USD")


# cad = Currency.new(200.00 ,"CAD")
#
#
# result = ( aud == aud2 )
# puts aud
# puts aud2
# puts "aud is equal to aud2: #{result}"
# #
# # sek = Currency.new(300.00  ,"SEK")
#
#
# puts aud.amount #--> 100.00
# puts cad.code   #--> "CAD"
# puts aud.code   #--> "AUD"
# puts aud.amount
# puts aud.code
# puts cad.amount
#
# puts "#{aud.amount} in the currency #{aud.code}"
