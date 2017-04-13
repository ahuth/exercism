class Robot {
  var name = generateName

  def reset() = {
    name = generateName
  }

  private[this] def generateName = {
    val stream = scala.util.Random.alphanumeric
    val alphas = stream.filter(_.isLetter).take(2).mkString.toUpperCase
    val numbers = stream.filter(_.isDigit).take(3).mkString.toUpperCase
    s"$alphas$numbers"
  }
}
