class Phrase(phrase: String) {
  val wordCount = phrase.split("[^\\w']+").groupBy(_.toLowerCase).mapValues(_.size)
}
