(ns hamming)

(defn- same-length?
  [first second]
  (=
    (count first)
    (count second)))

(defn- zip
  [first second]
  (map vector first second))

(defn- same?
  [[a b]]
  (= a b))

(defn- difference
  [first second]
  (->>
    (zip first second)
    (remove same?)
    (count)))

(defn distance
  [first second]
  (if (same-length? first second)
    (difference first second)
    nil))
