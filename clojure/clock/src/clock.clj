(ns clock)

(defn- zero-pad [num]
  (if (< num 10)
    (str "0" num)
    (str num)))

(defn- wrap-around [num to]
  (let [into (Math/abs (quot num to))]
    (cond
      (< num 0) (+ num to (* to into))
      (>= num to) (- num (* to into))
      :else num)))

(defn- transfer-around [num to]
  (cond
    (< num 0) (dec (quot num to))
    (>= num to) (quot num to)
    :else 0))

(defn clock [hour min]
  (let [adjusted-hour (+ hour (transfer-around min 60))]
    [(wrap-around adjusted-hour 24) (wrap-around min 60)]))

(defn clock->string [[hour min]]
  (str (zero-pad hour) ":" (zero-pad min)))

(defn add-time [[hour min] added]
  (clock hour (+ min added)))
