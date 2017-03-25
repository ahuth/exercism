(ns clock)

(defn clock [hour min]
  (->
    hour
    (* 60)
    (+ min)
    (mod 1440)))

(defn clock->string [min]
  (let [hours (quot min 60) remaining-min (rem min 60)]
    (format "%02d:%02d" hours remaining-min)))

(defn add-time [min added]
  (clock 0 (+ min added)))
