(ns word-count
  (:require [clojure.string :as str]))

(defn- extract-words
  [sentence]
  (remove str/blank? (str/split sentence #"[^A-Za-z0-9]")))

(defn word-count
  [sentence]
  (->
    sentence
    (str/lower-case)
    (extract-words)
    (frequencies)))
