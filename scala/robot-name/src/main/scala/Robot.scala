import scala.util.Random.{alphanumeric => an}

class Robot {
  var name = generateName
  def reset() = name = generateName

  private def generateName = {
    (an.filter(_.isUpper).take(2) ++ an.filter(_.isDigit).take(3)).mkString
  }
}
