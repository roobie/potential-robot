(ns pr.core
  (:require [clojure.string :as strings])
  (:require [pr.rooms :as rooms]
            [pr.commands :as commands]
            [pr.entity :as ent]))

(defn- get-name
  []
  (do
    (println "What is thy name?")
    (print "> ")
    (flush)
    (read-line)))

(defn game-loop
  []
  (let [name (get-name)]
    (loop [input ""
           player (ent/get-player name)]
      (do
        (when (not (strings/blank? input))
          (println (commands/execute input {:player player})))
        (println "===")
        (print (:prompt player))
        (flush)
        (recur (read-line)
               player)))))

(defn main
  ([dir]
   (rooms/add-from dir)
   (game-loop))
  ([] (main "resources/rooms")))

(defn -main
  []
  (main))
