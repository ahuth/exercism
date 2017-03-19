(ns nucleotide-count
  (:require [clojure.string :as str]))

(defn count
  [nucleotide strand]
  (let [counts (frequencies strand)]
    (if (str/includes? "ACGT" (str nucleotide))
      (get counts nucleotide 0)
      (throw Throwable))))

(defn nucleotide-counts
  [strand]
  {\A (count \A strand) \T (count \T strand) \C (count \C strand) \G (count \G strand)})
