(ns clock)

(defn- zero-pad [num]
  (if (< num 10)
    (str "0" num)
    (str num)))

(defn- wrap-around [num to]
  (cond
    (< num 0) (+ to (rem num to))
    (>= num to) (rem num to)
    :else num))

(defn clock [hour min]
  (->
    hour
    (* 60)
    (+ min)
    (wrap-around 1440)))

(defn clock->string [min]
  (let [hours (quot min 60) remaining-min (rem min 60)]
    (str (zero-pad hours) ":" (zero-pad remaining-min))))

(defn add-time [[hour min] added]
  (+ added (clock hour min)))
