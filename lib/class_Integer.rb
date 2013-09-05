require File.dirname(__FILE__) + '/methods/new_roman'
require File.dirname(__FILE__) + '/methods/old_roman'
require File.dirname(__FILE__) + '/methods/factorial'
require File.dirname(__FILE__) + '/methods/english_number'

class Integer
  def to_roman
    new_roman(self)
  end

  def to_old_roman
    old_roman(self)
  end

  def fact
  	factorial(self)
  end

  def to_english
    english_number(self)
  end
end