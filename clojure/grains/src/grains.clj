(ns grains)

(defn- pow [x n]
  (reduce * (repeat n (bigint x))))

(defn square [num]
  (pow 2 (dec num)))

(defn total []
  (dec (* (square 64) 2)))
