(ns robot-name)

(def name (atom ""))

(defn- rand-char []
  (str (rand-nth "ABCDEFGHIJKLMNOPQRSTUVWXYZ")))

(defn- rand-digit []
  (str (rand-int 9)))

(defn- rand-name []
  (str (rand-char) (rand-char) (rand-digit) (rand-digit) (rand-digit)))

(defn reset-name [_] (reset! name (rand-name)))
(defn robot [] (reset-name nil))
(defn robot-name [_] @name)
