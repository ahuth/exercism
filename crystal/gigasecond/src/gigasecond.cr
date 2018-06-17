class Gigasecond
  PER_GIGA = 1_000_000_000.seconds

  def self.from(date : Time) : Time
    date + PER_GIGA
  end
end
