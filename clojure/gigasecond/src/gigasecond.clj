(ns gigasecond
  (:import java.util.Calendar))

(defn- format [date]
  [(.get date Calendar/YEAR) (inc (.get date Calendar/MONTH)) (.get date Calendar/DATE)])

(defn from [year month day]
  (format (doto (Calendar/getInstance)
    (.set year (dec month) day)
    (.add Calendar/SECOND 1000000000))))
