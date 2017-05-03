case class SpaceAge(seconds: Long) {
  private val earthSeconds = BigDecimal(seconds.toFloat / 31557600)
  private def round(number: BigDecimal): BigDecimal = number.setScale(2, BigDecimal.RoundingMode.HALF_UP)
  val onEarth = round(earthSeconds)
  val onMercury = round(earthSeconds / 0.2408467)
  val onVenus = round(earthSeconds / 0.61519726)
  val onMars = round(earthSeconds / 1.8808158)
  val onJupiter = round(earthSeconds / 11.862615)
  val onSaturn = round(earthSeconds / 29.447498)
  val onUranus = round(earthSeconds / 84.016846)
  val onNeptune = round(earthSeconds / 164.79132)
}
