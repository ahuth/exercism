object SumOfMultiples {
  // This solution uses math. Not all the tests pass, and I got the math from
  // https://nicholassterling.wordpress.com/2010/09/10/scala-streams-and-project-euler-problem-1/.
  def sumOfMultiples(factors: Set[Int], limit: Int): Int = {
    sumMultiples(factors.toList, Nil, limit)
  }

  private def sumMultiples(factors: List[Int], priorFactors: List[Int], limit: Int): Int = factors match {
    case Nil => 0
    case factor :: rest => {
      val num = limit / factor
      // Not sure how this works, since I got this from someone else's solution. It appears that there's
      // a mathmatical formula we can use to calculate the sum of multiples for a given number. However,
      // when adding up the sums for multiple factors, we'll repeat some of the numbers, which gives us
      // the wrong total. That's why this is doing the subtraction and using the least-common-multiple
      // stuff.
      factor * (num * (num + 1) / 2) -
        sumMultiples(priorFactors.map(lcm(factor, _)).filter(_ <= limit), Nil, limit) +
        sumMultiples(rest, factor :: priorFactors, limit)
    }
  }

  private def lcm(a: Int, b: Int): Int = a * b / gcd(a, b)
  private def gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)
}
