(ns phone-number
  (:require [clojure.string :as str]))

(defn- clean
  [input]
  (str/replace input #"[\(\) \-\.]" ""))

(defn- remove-country-code
  [input]
  (if (and
        (= (count input) 11)
        (= (first input) \1))
    (subs input 1)
    input))

(defn- validate
  [input]
  (if (= (count input) 10)
    input
    "0000000000"))

(defn number
  [input]
  (->
    input
    clean
    remove-country-code
    validate))

(defn area-code
  [input]
  (subs (number input) 0 3))

(defn pretty-print
  [input]
  (let [digits (number input) a (subs digits 0 3) b (subs digits 3 6) c (subs digits 6)]
    (str "(" a ") " b "-" c)))
