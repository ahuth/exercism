(ns rna-transcription)

(defn- transcribe
  [char]
  (cond
    (= \G char) \C
    (= \C char) \G
    (= \T char) \A
    (= \A char) \U
    :else (throw (AssertionError.))))

(defn to-rna
  [strand]
  (->>
    strand
    (map transcribe)
    (apply str)))
