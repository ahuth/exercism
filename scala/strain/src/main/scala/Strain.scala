object Strain {
  def keep[T](list: Seq[T], func: T => Boolean): Seq[T] = list match {
    case Nil => Nil
    case head :: tail => func(head) match {
      case true => head +: keep(tail, func)
      case false => keep(tail, func)
    }
  }

  def discard[T](list: Seq[T], func: T => Boolean): Seq[T] = list match {
    case Nil => Nil
    case head :: tail => func(head) match {
      case true => discard(tail, func)
      case false => head +: discard(tail, func)
    }
  }
}
