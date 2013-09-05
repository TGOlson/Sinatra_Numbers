def english_number(number)
  raise ArgumentError.new("Input be greater than or equal to 0.") if number < 0
  return 'zero' if number == 0
  string = ''

  factor = number.to_s.length - 1

  if factor >= 2

    factor_check = [12,9,6,3] # trillions, billions, millions, thousands
    factor_check.each do |x|
      if factor >= x
        lead_digits = (number % 10 ** (x + 3)) / 10 ** x # remove numbers from higher and lower factors
        string += parser(lead_digits) + ' ' + factors(x) + ' ' if lead_digits != 0
      end
    end

    string += 'and ' if ((number % 1000 < 100) && (number % 1000 != 0))
    string += parser(number % 1000) # last three digits
    string.chop! if number % 1000 == 0 # remove extra space if no ones or tens
  else
    string += small_number(number)
  end
  
  string
end


def small_number(number) # numbers under 99
  string = ''
  small_hash   = {  1 => 'one',        2 => 'two',       3 => 'three', 
                    4 => 'four',       5 => 'five',      6 => 'six', 
                    7 => 'seven',      8 => 'eight',     9 => 'nine',
                   11 => 'eleven',    12 => 'twelve',   13 => 'thirteen', 
                   14 => 'fourteen',  15 => 'fifteen',  16 => 'sixteen', 
                   17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen',
                   10 => 'ten',       20 => 'twenty',   30 => 'thirty', 
                   40 => 'fourty',    50 => 'fifty',    60 => 'sixty', 
                   70 => 'seventy',   80 => 'eighty',   90 => 'ninety'}

  if number < 20
    return small_hash[number]
  else
    extra = number % 10
    string += small_hash[number - extra]
    string += ' ' + small_hash[extra] if extra != 0
  end
  string
end

def parser(number) # decides is lead_digits needs to be processed as hundreds, or a small number
  string = ''
  string += hundreds(number) if number >= 100
  string += small_number(number) if number < 100 && number != 0
  string
end 

def hundreds(number)
  string = ''
  string += small_number(number / 100 )
  string += ' ' + factors(2)
  string += ' and ' + small_number(number % 100) if number % 100 != 0
  string
end

def factors(number) # 10 ** factor
  hundred_hash = { 2 => 'hundred', 3 => 'thousand', 6 => 'million',
                   9 => 'billion', 12 => 'trillion'}
  hundred_hash[number]
end