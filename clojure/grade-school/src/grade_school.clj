(ns grade-school)

(defn- sort-key-value [db key value]
  (assoc db key (sort value)))

(defn- or-empty [item]
  (or item []))

(defn add [db student grade]
  (assoc db grade
    (conj
      (or-empty (db grade))
      student)))

(defn grade [db num]
  (or-empty (db num)))

(defn sorted [db]
  (into
    (sorted-map)
    (reduce-kv sort-key-value {} db)))
