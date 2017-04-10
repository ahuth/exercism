class DNA(dna: String) {
  def count(char: Char): Either[String, Int] = {
    nucleotideCounts match {
      case Right(counts) => Right(counts.getOrElse(char, 0))
      case Left(message) => Left(message)
    }
  }

  def nucleotideCounts: Either[String, Map[Char, Int]] = {
    Right(dna.groupBy(identity).mapValues(_.length))
  }
}
