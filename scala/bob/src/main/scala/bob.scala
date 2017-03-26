class Bob {
  def hey(phrase: String): String = phrase match {
    case s if isBlank(s) => "Fine. Be that way!"
    case s if isShout(s) => "Whoa, chill out!"
    case s if isQuestion(s) => "Sure."
    case _ => "Whatever."
  }

  private def isBlank(phrase: String): Boolean = phrase.trim().isEmpty()
  private def isShout(phrase: String): Boolean = phrase.toUpperCase() == phrase && phrase.toLowerCase() != phrase
  private def isQuestion(phrase: String): Boolean = phrase.endsWith("?")
}
