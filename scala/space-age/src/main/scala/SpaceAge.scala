object SpaceAge {
  def apply(seconds: Long) = new SpaceAge(seconds)
}

class SpaceAge(time: Long) {
  val seconds = time
  private val earthSeconds = BigDecimal(seconds.toFloat / 31557600)
  private val roundingMode = BigDecimal.RoundingMode.HALF_UP
  val onEarth = earthSeconds.setScale(2, roundingMode)
  val onMercury = (earthSeconds / 0.2408467).setScale(2, roundingMode)
  val onVenus = (earthSeconds / 0.61519726).setScale(2, roundingMode)
  val onMars = (earthSeconds / 1.8808158).setScale(2, roundingMode)
  val onJupiter = (earthSeconds / 11.862615).setScale(2, roundingMode)
  val onSaturn = (earthSeconds / 29.447498).setScale(2, roundingMode)
  val onUranus = (earthSeconds / 84.016846).setScale(2, roundingMode)
  val onNeptune = (earthSeconds / 164.79132).setScale(2, roundingMode)
}
