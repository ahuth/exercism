object Year {
  def apply(year: Int): Year = {
    new Year(year)
  }
}

class Year(year: Int) {
  val isLeap = year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
}
