(ns flatten-array)

(defn flatten [list]
  (let [[head & tail] list]
    (cond
      (empty? list) nil
      (nil? head) (flatten tail)
      (not (sequential? head)) (cons head (flatten tail))
      :else (concat (flatten head) (flatten tail)))))
