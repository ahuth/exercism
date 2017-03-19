(ns anagram
  (:require [clojure.string :as str]))

(defn- anagram?
  [word candidate]
  (=
    (sort (str/lower-case word))
    (sort (str/lower-case candidate))))

(defn- remove-from-list
  [word words]
  (remove #(= (str/lower-case word) (str/lower-case %)) words))

(defn anagrams-for
  [word candidates]
  (->>
    candidates
    (remove-from-list word)
    (filter (fn [candidate]
      (anagram? word candidate)))))
