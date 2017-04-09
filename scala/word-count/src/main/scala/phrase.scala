class Phrase(phrase: String) {
  val wordCount = phrase.toLowerCase().split("[^a-z0-9']+").groupBy(identity).mapValues(_.size)
}
