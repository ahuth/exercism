(ns leap)

(defn- eveny-divisible? [num into]
  (= 0 (rem into num)))

(defn leap-year? [year]
  (condp eveny-divisible? year
    400 true
    100 false
      4 true
        false))
