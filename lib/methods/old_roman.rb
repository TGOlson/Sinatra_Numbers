def old_roman(year)
  raise ArgumentError.new("Input must not be negative.") if year < 0
  string = ''
  string += 'M' * (year / 1000)
  string += 'D' * (year % 1000 / 500)
  string += 'C' * (year % 500 / 100)
  string += 'L' * (year % 100 / 50)
  string += 'X' * (year % 50 / 10)
  string += 'V' * (year % 10 / 5)
  string += 'I' * (year % 5 / 1)
  string
end