class Phrase(phrase: String) {
  val wordCount = phrase.toLowerCase().split("[^\\w']+").groupBy(identity).mapValues(_.size)
}
