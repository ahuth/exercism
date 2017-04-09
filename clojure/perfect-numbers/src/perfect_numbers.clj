(ns perfect-numbers)

(defn- factors-below [num]
  (filter #(zero? (rem num %)) (range 1 num)))

(defn- aliquot-sum [num]
  (reduce + (factors-below num)))

(defn classify [num]
  (if-not (pos? num)
    (throw (IllegalArgumentException. "number must be positive"))
    (let [aliquot (aliquot-sum num)]
      (cond
        (> aliquot num) :abundant
        (< aliquot num) :deficient
        :else :perfect))))
