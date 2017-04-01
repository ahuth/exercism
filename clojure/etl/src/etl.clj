(ns etl
  (:require [clojure.string :as str]))

(defn transform [m]
  (reduce-kv
    (fn [acc k v]
      (reduce #(assoc %1 (str/lower-case %2) k) acc v))
    {}
    m))
