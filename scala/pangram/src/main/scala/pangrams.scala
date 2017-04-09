object Pangrams {
  def isPangram(phrase: String): Boolean = {
    phrase.toLowerCase().replaceAll("[^a-z]", "").distinct.length == 26
  }
}
