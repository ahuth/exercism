(ns etl
  (:require [clojure.string :as str]))

(defn transform [m]
  (reduce-kv
    (fn [acc k v]
      (reduce
        (fn [acc item]
          (assoc acc (str/lower-case item) k))
        acc
        v))
    {}
    m))
