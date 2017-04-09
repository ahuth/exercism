object Pangrams {
  def isPangram(phrase: String): Boolean = {
    phrase.toLowerCase.filter(_.isLetter).distinct.length == 26
  }
}
