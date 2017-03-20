(ns hamming)

(defn- same-length?
  [first second]
  (=
    (count first)
    (count second)))

(defn- zip
  [first second]
  (map vector first second))

(defn- increment-if-different
  [num [a b]]
    (if (= a b)
      num
      (inc num)))

(defn- difference
  [first second]
  (reduce increment-if-different 0 (zip first second)))

(defn distance
  [first second]
  (if (same-length? first second)
    (difference first second)
    nil))
