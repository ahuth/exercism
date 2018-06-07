def is_leap_year(year: int) -> bool:
  return evenly_divides(year, 4) and (not evenly_divides(year, 100) or evenly_divides(year, 400))

def evenly_divides(num: int, divisor: int) -> bool:
  return num % divisor == 0
