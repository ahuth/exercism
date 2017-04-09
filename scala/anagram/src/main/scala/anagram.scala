class Anagram(word: String) {
  private[this] val normalized = word.toLowerCase.sorted
  private[this] val process = removeWord _ andThen selectAnagrams _

  def matches(candidates: Seq[String]): Seq[String] = {
    process(candidates)
  }

  private[this] def removeWord(list: Seq[String]): Seq[String] = {
    list.filterNot(x => x.toLowerCase == word.toLowerCase)
  }

  private[this] def selectAnagrams(list: Seq[String]): Seq[String] = {
    list.filter(x => normalize(x) == normalized)
  }

  private[this] def normalize(word: String): String = {
    word.toLowerCase.sorted
  }
}
