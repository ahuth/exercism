class Anagram(word: String) {
  private[this] val normalized = word.toLowerCase.sorted

  def matches(candidates: Seq[String]): Seq[String] = {
    candidates.distinct.filterNot(x => x.toLowerCase == word.toLowerCase).filter(x => x.toLowerCase.sorted == normalized)
  }
}
