object RunLengthEncoding {
  val ConsecutiveCharacterPattern = "(?<=(.))(?!\\1)"
  val NumberCharacterRegex = "(\\d*)(.)".r

  def encode(str: String): String = {
    str.split(ConsecutiveCharacterPattern).map(c => {
      c.length match {
        case 0 => ""
        case 1 => c
        case n => s"$n${c.head}"
      }
    }).mkString
  }

  def decode(str: String): String = {
    NumberCharacterRegex.findAllIn(str).map(combo => {
      combo match {
        case NumberCharacterRegex("", character) => character
        case NumberCharacterRegex(num, character) => character * num.toInt
      }
    }).mkString
  }
}
