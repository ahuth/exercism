(ns space-age)

(defn on-earth [seconds]
  (/ seconds 31557600))

(defmacro defplanet [name period]
  `(defn ~(symbol (str "on-" name)) [~'seconds] (/ (on-earth ~'seconds) ~period)))

(defplanet mercury 0.2408467)
(defplanet venus 0.61519726)
(defplanet mars 1.8808158)
(defplanet jupiter 11.862615)
(defplanet saturn 29.4474985)
(defplanet uranus 84.016846)
(defplanet neptune 164.79132)
