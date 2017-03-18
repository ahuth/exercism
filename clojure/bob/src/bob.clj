(ns bob)
(use 'clojure.string)

(defn shouting?
  [phrase]
  (and
    (= phrase (upper-case phrase))
    (not= phrase (lower-case phrase))))

(defn question?
  [phrase]
  (ends-with? phrase "?"))

(defn response-for
  [phrase]
  (cond
    (blank? phrase) "Fine. Be that way!"
    (shouting? phrase) "Whoa, chill out!"
    (question? phrase) "Sure."
    :else "Whatever."))
