(ns leap)

(defn leap-year? [year]
  (or
    (and
      (= 0 (rem year 4))
      (not= 0 (rem year 100)))
    (= 0 (rem year 400))))
