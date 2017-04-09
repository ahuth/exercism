class Anagram(word: String) {
  private[this] val lowered = word.toLowerCase

  def matches(candidates: Seq[String]): Seq[String] = {
    candidates.filterNot(_.toLowerCase == lowered).filter(_.toLowerCase.sorted == lowered.sorted)
  }
}
