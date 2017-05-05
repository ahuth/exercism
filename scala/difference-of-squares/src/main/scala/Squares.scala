object Squares {
  def squareOfSums(num: Int): Int = squared((0 to num).reduce(_ + _))
  def sumOfSquares(num: Int): Int = (0 to num).reduce(_ + squared(_))
  def difference(num: Int): Int = squareOfSums(num) - sumOfSquares(num)
  private def squared(num: Int): Int = num * num
}
