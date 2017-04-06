(ns binary-search)

(defn middle [vec]
  (quot (count vec) 2))

(defn search-for
  ([num collection]
    (search-for num collection 0))
  ([num collection offset]
    (assert (not-empty collection) "not found")
    (let [array (vec collection) mid (middle array) guess (nth array mid) position (+ offset mid)]
      (cond
        (= guess num) position
        (> guess num) (search-for num (subvec array 0 mid) offset)
        :else (search-for num (subvec array (inc mid)) (inc position))))))
