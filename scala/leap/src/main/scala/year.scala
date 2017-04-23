object Year {
  def apply(year: Int): Year = new Year(year)
}

class Year(year: Int) {
  val isLeap = mod(400) || (mod(4) && !mod(100))
  private def mod(value: Int): Boolean = year % value == 0
}
