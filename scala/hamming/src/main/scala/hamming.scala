object Hamming {
  def compute(first: String, second: String): Option[Int] = (first, second) match {
    case (a, b) if a == b => Some(0)
    case (a, b) if a.length != b.length => None
    case _ => {
      val score = if (first.head == second.head) 0 else 1
      compute(first.tail, second.tail).map(x => score + x)
    }
  }
}
