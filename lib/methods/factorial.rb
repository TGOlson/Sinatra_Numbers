def factorial(year)
    raise ArgumentError.new("Input be greater than or equal to 0.") if year < 0
    year <= 1 ? 1 : year * factorial(year-1)
end