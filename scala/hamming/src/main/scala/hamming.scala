object Hamming {
  def compute(first: String, second: String, distance: Int = 0): Option[Int] = (first, second) match {
    case (a, b) if a == b => Some(distance)
    case (a, b) if a.length != b.length => None
    case (a, b) if a.head == b.head => compute(a.tail, second.tail, distance)
    case _ => compute(first.tail, second.tail, distance + 1)
  }
}
