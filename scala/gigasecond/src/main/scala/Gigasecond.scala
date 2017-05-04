import java.time.{LocalDate, LocalDateTime}

object Gigasecond {
  def addGigaseconds(date: LocalDate): LocalDateTime = addGigaseconds(date.atStartOfDay)
  def addGigaseconds(datetime: LocalDateTime): LocalDateTime = datetime.plusSeconds(1000000000)
}
