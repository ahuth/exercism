(ns meetup)

(defn- find-matching-date [year month weekday start end]
  (first
    (filter
      (fn [date]
        (= weekday (.getDay date)))
      (map #(new java.util.Date (- year 1900) (dec month) %1) (range start (inc end))))))

(defn- find-java-day [weekday]
  (condp = weekday
    :sunday 0
    :monday 1
    :tuesday 2
    :wednesday 3
    :thursday 4
    :friday 5
    :saturday 6))

(defn- from-range [year month weekday start end]
  (let [num (find-java-day weekday) date (find-matching-date year month num start end)]
    [year month (.getDate date)]))

(defn meetup [month year weekday descriptor]
  (condp = descriptor
    :first (from-range year month weekday 1 7)
    :second (from-range year month weekday 8 14)
    :third (from-range year month weekday 15 21)
    :fourth (from-range year month weekday 22 28)
    :teenth (from-range year month weekday 13 19)
    :last (from-range year month weekday -7 -1)))
